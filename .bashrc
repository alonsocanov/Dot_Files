# virtual  environment with virtualenvwrapper
if [ -d $HOME/.virtualenvs ]; then 
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
	source /usr/local/bin/virtualenvwrapper.sh
	export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin
fi

# If file with aliases exists
if [ -f $HOME/.bash_aliases ]; then
   . $HOME/.bash_aliases
fi

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


#aliases
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#Color
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lah --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


if [[ $? == 0 ]]; then
    export PS1="\[\033[33m\]\W\\ \[\033[1;34m\]>\[\033[1;31m\]>\[\033[1;33m\]>\[\033[37m\] "
else
    export PS1="\[\033[00m\]\W\\ \[\033[1;34m\]>\[\033[1;31m\]>\[\033[1;33m\]>\[\033[37m\] "
fi

export LD_LIBRARY_PATH=/usr/local/cuda/lib64

export PATH=/home/nvidia/cmake-3.13.0/bin/:$PATH

# ROS
source /opt/ros/melodic/setup.bash
export ROS_MASTER_URI=http://localhost:11311
export ROS_IP=192.168.1.155
export LD_LIBRARY_PATH=/usr/local/lib:/opt/ros/melodic/lib
