#!/bin/sh

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:ondrej/php

sudo apt update
sudo apt install \
  bat \
  curl \
  direnv \
  fzf \
  fd-find \
  jq \
  ripgrep \
  tree \
  software-properties-common \
  gh \
  neovim \

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

