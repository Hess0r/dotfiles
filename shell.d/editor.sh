if type nvim &>/dev/null; then
    export EDITOR=nvim
    export VISUAL=nvim
else 
    export EDITOR=vim
    export VISUAL=vim
fi
