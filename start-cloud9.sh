#!/bin/sh

if [[ ! -f ~/.c9/node/bin/node ]]
then
  echo "> copying .c9 folder to home drive"
  cp -r /c9/.c9 ~
else
  echo "> home drive has existing .c9 folder"
fi

echo "> starting cloud9"

~/.c9/node/bin/node c9sdk/server.js -w /root --listen 0.0.0.0 -a ":"

