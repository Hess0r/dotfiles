#!/bin/bash

ch() {
    selected=`cat ~/.shell.d/cheatsheet-commands ~/.shell.d/cheatsheet-languages | fzf --layout=reverse --height=10% --preview-window=right:hidden --info=inline`
    if [[ -z $selected ]]; then
        return
    fi

    echo "Selected $selected"

    read -p "Query: " query

    if grep -qs "$selected" ~/.shell.d/cheatsheet-languages; then
        echo "cht.sh/$selected/`echo $query | tr ' ' '+'`"
        curl -s cht.sh/$selected/`echo $query | tr ' ' '+'` | bat
    else
        echo "cht.sh/$selected~$query"
        curl -s cht.sh/$selected~$query | bat
    fi
}
