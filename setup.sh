#!/bin/sh

ln -sf "$PWD/bash/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/bash/inputrc" "$HOME/.inputrc"

ln -snf "$PWD/bash/scripts" "$HOME/.local/bin/scripts"

ln -sf "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

rm -rf "$HOME/.config/nvim"
ln -sf "$PWD/nvim" "$HOME/.config"

ln -sf "$PWD/git/personal" "$HOME/.gitconfig"
ln -sf "$PWD/git/gitignore_global" "$HOME/.gitignore_global"

mkdir -p "$HOME/.config/starship"
ln -sf "$PWD/starship/config.toml" "$HOME/.config/starship"
