vsc_save () {
  config_folder="$HOME/.config/Code/User"

  files=("settings.json")
  files+=("keybindings.json")
  # TODO: snippets

  for f in ${files[@]}; do
    if [[ -f "$config_folder/$f" ]]; then
      echo "copying $config_folder/$f to $DOTFILES/vscode/$f"
      cp "$config_folder/$f" "$DOTFILES/vscode/$f"
    fi
  done
}

vsc_load () {
  config_folder="$HOME/.config/Code/User"

  files=("settings.json")
  files+=("keybindings.json")
  # TODO: snippets

  for f in ${files[@]}; do
    if [[ -f "$config_folder/$f" ]]; then
      echo "copying $DOTFILES/vscode/$f to $config_folder/$f"
      cp "$DOTFILES/vscode/$f" "$config_folder/$f"
    fi
  done
}

