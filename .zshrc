echo "hi"
# Ixaya SVN
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.bin
export SVN_EDITOR=vim

#virtualenv and virtualenvwrapper
if [ -d $HOME/.virtualenvs ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
    export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin
else
    echo "Virtualenv and virtualenvwerapper not installed in the following path: $HOME/.virtualenvs"
fi

LANG="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
# PS1 name on terminal (needs to export)
#export PS1=$MY_PROMPT
MY_PROMPT="%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "


# brew branch visualization, installed with brew romkatv/gitstatus/gitstatus
# github https://github.com/romkatv/gitstatus
# left prompt :PROMPT
# right prompt: RPROMPT
if [[ -f $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh ]]; then
    source $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh
    PROMPT=$MY_PROMPT
    RPROMPT='$GITSTATUS_PROMPT'
else
    # PS1 name on terminal
    export RPROMPT=$MY_PROMPT
fi

#syntax higliting
if [[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo "Syntax hylighting not installed"
fi

# autosugestions
if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    echo "Autosuggestions not installed"
fi

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
        echo "Could not find file to $UTILS_PATH"
    fi

else
    echo "Could not find link to $HOME/.zshrc"
fi
