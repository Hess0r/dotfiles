if type gh &>/dev/null; then
  eval "$(gh completion -s bash)"
fi

if type kind &>/dev/null; then
  source <(kind completion bash)
fi

if type kubectl &>/dev/null; then
  source <(kubectl completion bash)
fi

[ -f /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
