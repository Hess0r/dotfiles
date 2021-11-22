#!/bin/sh

if type yarn &>/dev/null; then
  yarn global add dockerfile-language-server-nodejs \
    bash-language-server \
    vscode-langservers-extracted \
    typescript typescript-language-server \
    intelephense \
    yaml-language-server
else
  echo "Yarn not installed"
fi
