#!/bin/sh

if [[ ! -f ~/.c9/node/bin/node ]]
then
  echo "copying .c9 folder"
  cp -r /c9/.c9 ~
fi

echo "starting cloud9"

~/.c9/node/bin/node c9sdk/server.js -w /root --listen 0.0.0.0 -a ":"

