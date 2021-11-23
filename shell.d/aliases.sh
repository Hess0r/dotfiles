# standard ubuntu coloring
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# standard ubuntu ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# vim to nvim
if type nvim &>/dev/null; then
  alias vim='nvim'
fi

# docker compose aliases
dcv1='docker-compose'
dcv2='docker compose'
dcExe='docker compose'
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

# alias for Laravel Sail binary
alias sail='./vendor/bin/sail'

# directory shortcuts
alias dotfiles='cd ~/dotfiles'

# git aliases
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset%s%Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glogs="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glogds="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s%Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gloga="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
