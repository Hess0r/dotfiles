# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source "$HOME/.shell.d/editor.sh"
source "$HOME/.shell.d/golang.sh"
source "$HOME/.shell.d/path.sh"
source "$HOME/.shell.d/prompt.sh"
source "$HOME/.shell.d/aliases.sh"
source "$HOME/.shell.d/completion.bash"
source "$HOME/.shell.d/direnv.bash"
source "$HOME/.shell.d/fzf.sh"
source "$HOME/.shell.d/nvm.sh"
source "$HOME/.shell.d/cheatsheet.sh"
if [[ -f "$HOME/.secrets/keys.sh" ]]; then 
  source "$HOME/.secrets/keys.sh"
fi

# Change this to the folder, where dotfiles were cloned
export DOTFILES="$HOME/dotfiles"

