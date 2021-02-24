# Ixaya SVN
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.bin
export SVN_EDITOR=vim

#virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin

# if a file with aliases exists it will be run
if [[ -f $HOME/.bash_aliases ]]; then
     . $HOME/.bash_aliases
fi


LANG="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -lah"

# PS1 name on terminal
export PS1="%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "


# autosugestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


function create(){
    # cd $HOME/Developer
    DIR="$HOME/Developer/$1";
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
    fi

}
