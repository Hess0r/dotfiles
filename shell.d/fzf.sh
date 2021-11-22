FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' "
FZF_DEFAULT_OPTS+="--bind alt-j:preview-down,alt-k:preview-up "
FZF_DEFAULT_OPTS+="--preview '([[ -f {} ]] && (bat --color=always --style=header,grid --line-range :300 {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -200'"
export FZF_DEFAULT_OPTS
# export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_COMMAND="rg --files"

fco() {
    branch=`git branch | fzf --layout=reverse --height=10% --preview-window=right:hidden --info=inline | tr -d "*"`
    if [[ -z $branch ]]; then
        return 0
    fi
    git checkout $branch
}

fdiff() {
    git diff $@ --name-only | fzf -m --ansi --preview 'git diff $@ --color=always -- {-1}'
}

fmux() {
    session=`tmux ls | fzf --layout=reverse --height=10% --preview-window=right:hidden --info=inline | sed 's/:.*//'`
    if [[ -z $session ]]; then
        return 0
    fi
    tmux a -t $session
}
