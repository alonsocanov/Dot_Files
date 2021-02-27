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
    echo "Virtualenv and virtualenvwerapper not installed"
fi


# current directory echo"${0:a:h}"

# check if link exixts
if [[ -L $HOME/.zshrc  &&  -e $HOME/.zshrc ]]; then
    DIR_PATH=$HOME/$(dirname $(readlink $HOME/.zshrc))
    # if a file with aliases exists it will be run
    if [[ -f $DIR_PATH/.aliases.sh ]]; then
        . $DIR_PATH/.aliases.sh
    else
        echo "Could not find file to $DIR_PATH/.aliases.sh"
    fi
else
    echo "Could not find link to $HOME/.zshrc"
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
fi
# autosugestions
if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


function create(){
    # cd $HOME/Developer
    DIR="$HOME/Developer/$1"
    if [[ ! -d "$DIR" ]]; then

        echo "Creating $DIR"
        mkdir "$DIR"
        echo "Changing directory"
        cd "$DIR"
        echo "Adding README.md"
        touch "README.md"
        echo "Creating .gitignore"
        touch ".gitignore"
        echo '*.DS_Store' >> .gitignore
        echo '*__pycache__*' >> .gitignore
        echo '*.vscode*' >> .gitignore
        open https://github.com/new
        git init
        git add .
        git commit -m "First Commit"
        git push -u origin master
    else
        echo "This path already exists $DIR"
    fi
}