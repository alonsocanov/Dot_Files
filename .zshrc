# Ixaya SVN
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.bin
export SVN_EDITOR=vim



LANG="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
# PS1 name on terminal (needs to export)
#export PS1=$MY_PROMPT
MY_PROMPT="%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "
export PS1=$MY_PROMPT



# current directory echo"${0:a:h}"

# check if link exixts
if [[ -L $HOME/.zshrc  &&  -e $HOME/.zshrc ]]; then
    DIR_PATH=$HOME/$(dirname $(readlink $HOME/.zshrc))

    # check if aliases.sh exists
    ALIASES_PATH=$DIR_PATH/.aliases.sh
    if [[ -f  $ALIASES_PATH ]]; then
        . $ALIASES_PATH
    else
        echo "Could not find file to $ALIASES_PATH"
    fi

    # check if file utils.sh exists
    UTILS_PATH=$DIR_PATH/.utils.sh
    if [[ -f $UTILS_PATH ]]; then
        . $UTILS_PATH
    else
        echo "Could not find file $UTILS_PATH"
    fi


    # check if brew is installed (mac)
    # if [[ -d $(brew --prefix) ]]; then
    #     # find file .brew_plugins.sh
    #     BREW_PATH=$DIR_PATH/.brew_plugins.sh
    #     if [[ -f $BREW_PATH ]]; then
    #         . $BREW_PATH
    #     else
    #         echo "Could not find file $BREW_PATH"
    #     fi
    # else
    #     echo "Brew is not installed"
    # fi

    # check if file functions.sh exists
    FUNCTIONS_PATH=$DIR_PATH/.functions.sh
    if [[ -f $FUNCTIONS_PATH ]]; then
        . $FUNCTIONS_PATH
    else
        echo "Could not find file $FUNCTIONS_PATH"
    fi
    
    # source ROS to enable
    if [[ -f /opt/ros/noetic/setup.zsh ]]; then
    	source /opt/ros/noetic/setup.zsh
	if [[ -f $HOME/catkin_ws/devel/setup.zsh ]]; then
	   source $HOME/catkin_ws/devel/setup.zsh
        else
           echo "No file $HOME/catkin_ws/devel/setup.zsh"
        fi
    else
	echo "Could not find ROS Noetic dir"
    fi

    # virtualenv and virtualenvwraper
    if [[ -d $HOME/.virtualenvs ]]; then
    	export WORKON_HOME=$HOME/.virtualenvs
    	VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
        . /usr/local/bin/virtualenvwrapper.sh
    else
	echo "No .virtualenvs directory"
    fi

else
    echo "Could not find link to $HOME/.zshrc"
fi
