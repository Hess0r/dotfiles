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
  software-properties-common \
  neovim

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt update
sudo apt install \
  gh \
  neovim

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

