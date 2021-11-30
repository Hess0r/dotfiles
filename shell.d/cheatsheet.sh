# commands, and programs
options=("tmux" "git" "vim" "sed" "grep" "find" "man" "awk" "tr" "xargs" "less" "tail" "tar" "rm" "cp" "rename" "jq" "cat" "bat" "docker" "docker-compose" "chmod" "chown" "make" "ssh" "more" "tldr")
# programming languages
options+=("golang" "javascript" "typescript" "bash" "php" "css" "html" "nodejs")

ch() {
   selected=`printf "%s\n" "${options[@]}" | fzf --layout=reverse --height=10% --preview-window=right:hidden --info=inline`
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
