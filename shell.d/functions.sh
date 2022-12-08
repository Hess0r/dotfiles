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

n() {
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
      echo "nnn is already running"
      return
    fi

    # Use export to ALWAYS cd on quit, otherwise its goind to cd on ^G
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
      . "$NNN_TMPFILE"
      rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

chphp() {
  local phpfile=/usr/bin/php$1
  if [ -f "$phpfile" ]; then
    sudo update-alternatives --set php /usr/bin/php$1
    return 0;
  else
    echo "File: $phpfile does not exist!"
    return 1;
  fi
}

fcd() {
  directory=$(fd . ~/Repos ~/Repos/Parked -t d -d 1 | fzf)

  if [[ -z $directory ]]; then
    exit 0
  fi

  cd $directory
}

frepo() {
  directory=$(fd . ~/Repos ~/Work/Repos -t d -d 1 -E Parked | fzf)

  if [[ -z $directory ]]; then
    exit 0
  fi

  session_name=$(basename "$directory")
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $session_name -c $directory
    exit 0
  fi

  if ! tmux has-session -t=$session_name 2> /dev/null; then
    tmux new-session -ds $session_name -c $directory
  fi

  if [[ -z $TMUX ]]; then
    tmux attach-session -t $session_name
  else
    tmux switch-client -t $session_name
  fi
}
