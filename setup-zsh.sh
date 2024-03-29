#!/bin/sh

ln -sf "$PWD/zsh/zshrc" "$HOME/.zshrc"
#ln -sf "$PWD/bash/inputrc" "$HOME/.inputrc"

ln -snf "$PWD/bash/scripts" "$HOME/.local/bin/scripts"

ln -sf "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

rm -rf "$HOME/.config/nvim"
ln -snf "$PWD/nvim" "$HOME/.config/nvim"

ln -sf "$PWD/git/personal" "$HOME/.gitconfig"
ln -sf "$PWD/git/gitignore_global" "$HOME/.gitignore_global"
