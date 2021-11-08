#!/bin/bash

ch() {
    selected=`cat ~/.shell.d/cheatsheet-commands ~/.shell.d/cheatsheet-languages | fzf --layout=reverse --height=10% --preview-window=right:hidden --info=inline`
    if [[ -z $selected ]]; then
        return
    fi

    read -p "Query: " query

    if grep -qs "$selected" ~/.shell.d/cheatsheet-languages; then
        curl -s cht.sh/$selected/`echo $query | tr ' ' '+'` | bat
    else
        curl -s cht.sh/$selected~$query | bat
    fi
}
