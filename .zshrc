# Ixaya SVN
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.bin
export SVN_EDITOR=vim



LANG="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
# PS1 name on terminal (needs to export)
#export PS1=$MY_PROMPT
export TITLE='%n@%m'
MY_PROMPT="%n@%m:%(!.%F{white}.%F{orange})%~%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "

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


    # check if brew is installed (mac)
    if [[ -d $(brew --prefix) ]]; then
        # find file .brew_plugins.sh
        BREW_PATH=$DIR_PATH/.brew_plugins.sh
        if [[ -f $BREW_PATH ]]; then
            . $BREW_PATH
        else
            echo "Could not find file $BREW_PATH"
            PROMPT=$MY_PROMPT
        fi
    else
        echo "Brew is not installed"
    fi

    # check if file functions.sh exists
    FUNCTIONS_PATH=$DIR_PATH/.functions.sh
    if [[ -f $FUNCTIONS_PATH ]]; then
        . $FUNCTIONS_PATH
    else
        echo "Could not find file $FUNCTIONS_PATH"
    fi

else
    echo "Could not find link to $HOME/.zshrc"
fi

#Xterm avaliability
#----------  xhost +
#opencv for c++ find packages
#export PATH="/usr/local/opt/openjdk/bin:$PATH"
#export CPPFLAGS="-I/usr/local/opt/openjdk/include"

#opencv find path for vscodei
# OPENCV_PATH=/usr/local/opt/opencv@4/lib/pkgconfig
# if [[ -d $OPENCV_PATH ]]; then
#     export PKG_CONFIG_PATH=$OPENCV_PATH
#     export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
# else
#     echo "Directory $OPENCV_PATH for opencv does not exist"
# fi

# clear terminal
#clear
