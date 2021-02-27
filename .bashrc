echo "hi"

# virtual  environment with virtualenvwrapper
if [ -d $HOME/.virtualenvs ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
	source /usr/local/bin/virtualenvwrapper.sh
	export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin
else
    echo "Virtualenv and virtualenvwerapper not installed in the following path: $HOME/.virtualenvs"
fi


# check if bashrc link exists
if [[ -L $HOME/.zshrc  &&  -e $HOME/.zshrc ]]; then
    DIR_PATH=$HOME/$(dirname $(readlink $HOME/.zshrc))
    # if a file with aliases exists it will be run
    if [[ -f $DIR_PATH/.aliases.sh ]]; then
        . $DIR_PATH/.aliases.sh
    else
        echo "Could not find file to $DIR_PATH/.aliases.sh"
    fi
else
    echo "Could not find symbolic link to $HOME/.bashrc"
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

LANG="en_US.UTF-8"

# jetson add-ons
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
# make torch work on jetson nano
export OPENBLAS_CORETYPE=ARMV8
# make nvida run on jetson nano
export PATH=/home/nvidia/cmake-3.13.0/bin/:$PATH

# ROS
source /opt/ros/melodic/setup.bash
export ROS_MASTER_URI=http://localhost:11311
export ROS_IP=192.168.1.155
export LD_LIBRARY_PATH=/usr/local/lib:/opt/ros/melodic/lib
