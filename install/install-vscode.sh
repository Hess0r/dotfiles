#!/bin/sh

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

code --install-extension \
    PKief.material-icon-theme \
    zhuangtongfa.material-theme \
    sleistner.vscode-fileutils \
    mhutchie.git-graph \
    ms-vscode-remote.remote-containers \
    esbenp.prettier-vscode \
    dbaeumer.vscode-eslint \
    ms-azuretools.vscode-docker \
    vscodevim.vim \
    golang.Go
