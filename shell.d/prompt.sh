export PSBLUE=$'\033[34m'
export PSGREEN=$'\033[32m'
export PSUNSET=$'\033[00m'
export PSPURPLE=$'\033[35m'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

export PS1='\[${PSGREEN}\]\u:\[${PSBLUE}\]\W\[${PSPURPLE}\]$(__git_ps1 " (%s)")\[${PSUNSET}\]$ '
