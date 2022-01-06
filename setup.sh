#!/bin/sh

ln -sf "$PWD/bashrc" "$HOME/.bashrc"

# TODO figure out a way to remove this
ln -sf "$PWD/shell.d" "$HOME/.shell.d"

ln -sf "$PWD/vim/vimrc" "$HOME/.vimrc"
ln -sf "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/inputrc" "$HOME/.inputrc"
[ -d "$PWD/secrets" ] && ln -sf "$PWD/secrets" "$HOME/.secrets"

# mkdir -p "$HOME/.vim"

#mkdir -p "$HOME/.config/nvim"
# ln -sf "$PWD/nvim/init.vim" "$HOME/.config/nvim/init.vim"

ln -sf "$PWD/nvim" "$HOME/.config"

mkdir -p "$HOME/.config/starship"
ln -sf "$PWD/starship/config.toml" "$HOME/.config/starship/config.toml"
