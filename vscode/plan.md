Migrate vscode settings from ~/.config/Code/User to here, and set up symlinks

For starters, migrate settings.json, and keybindings.json.

Snippets could also be an easy one.

Later figure out a way to make extensions portable as well.
Possible solution is an install script which is calling `code --install-extension ...`.
