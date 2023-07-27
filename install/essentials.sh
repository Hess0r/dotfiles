#!/bin/sh

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
  tmux \
  software-properties-common

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

