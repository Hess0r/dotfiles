#!/bin/sh

ln -sf "$PWD/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/shell.d" "$HOME/.shell.d"
ln -sf "$PWD/vim/vimrc" "$HOME/.vimrc"
ln -sf "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/inputrc" "$HOME/.inputrc"
[ -d "$PWD/secrets" ] && ln -sf "$PWD/secrets" "$HOME/.secrets"
