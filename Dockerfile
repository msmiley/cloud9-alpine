FROM alpine:3.8

#############################
# Alpine APKs dependencies
RUN apk update && apk --no-cache add -U git curl python tmux bash make gcc g++ ca-certificates wget linux-headers binutils-gold nodejs nodejs-npm && update-ca-certificates

#############################
# Cloud9 IDE
# default ide port is 8181
# 8080, 8081 and 8082 are ports cloud9 prefers for running your webapps
EXPOSE 8181 8080 8081 8082

# add in some nice Cloud9 default settings
COPY user.settings /root/.c9/
COPY .c9 /home/.c9

# install cloud9
RUN git clone git://github.com/c9/core.git c9sdk \
  && cd c9sdk \
  && sed -i "s/\/c9\/install/\/msmiley\/install/" ./scripts/install-sdk.sh \
  && ./scripts/install-sdk.sh \
  && ln -s /c9sdk/bin/c9 /usr/bin/c9

# start cloud9 with no authentication by default
# if authentication is desired, set the value of -a, i.e. -a user:pass at the end of the docker run line
ENTRYPOINT ["/root/.c9/node/bin/node", "c9sdk/server.js", "-w", "/home", "--listen", "0.0.0.0"]
CMD ["-a", ":"]