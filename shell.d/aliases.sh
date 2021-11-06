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

# docker-compose aliases
alias dco='docker-compose'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcps='docker-compose ps'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcr='docker-compose run'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcupb='docker-compose up --build'
alias dcupd='docker-compose up -d'
alias dcdn='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcpull='docker-compose pull'
alias dcstart='docker-compose start'
alias dck='docker-compose kill'

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
