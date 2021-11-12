export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
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
