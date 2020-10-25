# virtual  environment with virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin

# If file with aliases exists
if [ -f .files/.bash_aliases ]; then
   . .files/.bash_aliases
fi



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

if [[ $? == 0 ]]; then
    export PS1="\[\033[33m\]\W\\ \[\033[1;34m\]>\[\033[1;31m\]>\[\033[1;33m\]>\[\033[37m\] "
else
    export PS1="\[\033[00m\]\W\\ \[\033[1;34m\]>\[\033[1;31m\]>\[\033[1;33m\]>\[\033[37m\] "
fi

export PATH=/home/nvidia/cmake-3.13.0/bin/:$PATH
