# DEFAULT
# ==========================================================
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
# ==========================================================

# EXPORTS
# ==========================================================
export DOTFILES="$HOME/dotfiles"

if type nvim &>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
else
  export EDITOR=vim
  export VISUAL=vim
fi

export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"

FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' "
FZF_DEFAULT_OPTS+="--bind alt-j:preview-down,alt-k:preview-up "
FZF_DEFAULT_OPTS+="--preview '([[ -f {} ]] && (bat --color=always --style=header,grid --line-range :300 {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -200'"
export FZF_DEFAULT_OPTS
# export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_COMMAND="rg --files"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# ==========================================================

# ALIASES
# ==========================================================
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
if type nvim &>/dev/null; then
  alias vim='nvim'
fi
dcv1='docker-compose'
dcv2='docker compose'
dcExe='docker compose'
alias dco="$dcExe"
alias dcb="$dcExe build"
alias dce="$dcExe exec"
alias dcps="$dcExe ps"
alias dcc="$dcExe config"
alias dcrestart="$dcExe restart"
alias dcrm="$dcExe rm"
alias dcr="$dcExe run"
alias dcstop="$dcExe stop"
alias dcup="$dcExe up"
alias dcupb="$dcExe up --build"
alias dcupd="$dcExe up -d"
alias dcdn="$dcExe down"
alias dcl="$dcExe logs"
alias dclf="$dcExe logs -f"
alias dcpull="$dcExe pull"
alias dcstart="$dcExe start"
alias dck="$dcExe kill"
alias sail='./vendor/bin/sail'
alias dotfiles="cd $DOTFILES"
alias gs='git status'
alias gco='git checkout'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset%s%Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glogs="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glogds="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s%Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gloga="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
# ==========================================================

# COMPLETION
# ==========================================================
if type gh &>/dev/null; then
  eval "$(gh completion -s bash)"
fi
if type kind &>/dev/null; then
  source <(kind completion bash)
fi
if type kubectl &>/dev/null; then
  source <(kubectl completion bash)
fi
if type skaffold &>/dev/null; then
  source <(skaffold completion bash)
fi
if type direnv &>/dev/null; then
  eval "$(direnv hook bash)"
fi

[ -f "`which starship`" ] && eval "$(starship init bash)"
[ -f /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# ==========================================================

# FUNCTIONS
# ==========================================================
chdc() {
  [[ "$dcExe" == "$dcv1" ]] && dcExe=$dcv2 || dcExe=$dcv1
  alias dco="$dcExe"
  alias dcb="$dcExe build"
  alias dce="$dcExe exec"
  alias dcps="$dcExe ps"
  alias dcrestart="$dcExe restart"
  alias dcrm="$dcExe rm"
  alias dcr="$dcExe run"
  alias dcstop="$dcExe stop"
  alias dcup="$dcExe up"
  alias dcupb="$dcExe up --build"
  alias dcupd="$dcExe up -d"
  alias dcdn="$dcExe down"
  alias dcl="$dcExe logs"
  alias dclf="$dcExe logs -f"
  alias dcpull="$dcExe pull"
  alias dcstart="$dcExe start"
  alias dck="$dcExe kill"
}

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

# source own shell functions in .sh files from shell.d dir
if [[ -d "$HOME/.shell.d" ]]; then
  for f in "$HOME/.shell.d/*.sh"
  do
    source $f
  done
fi
# ==========================================================


if [[ -f "$HOME/.secrets/keys.sh" ]]; then
  source "$HOME/.secrets/keys.sh"
fi

