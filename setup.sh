#!/bin/sh

# ln -sf "$PWD/bash/bashrc" "$HOME/.bashrc"
# ln -sf "$PWD/bash/inputrc" "$HOME/.inputrc"

# rm "$HOME/.shell.d"
# ln -sf "$PWD/shell.d" "$HOME/"

# ln -sf "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
# [ -d "$PWD/secrets" ] && ln -sf "$PWD/secrets" "$HOME/.secrets"

# mkdir -p "$HOME/.vim"

rm -rf "$HOME/.config/nvim"
ln -sf "$PWD/nvim" "$HOME/.config"

# mkdir -p "$HOME/.config/starship"
# ln -sf "$PWD/starship/config.toml" "$HOME/.config/starship/config.toml"

# if type code &>/dev/null; then
#   cp "$PWD/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
#   cp "$PWD/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
# fi
