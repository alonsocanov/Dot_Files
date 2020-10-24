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
if [ -f ./.bash_aliases ]; then
    . ./.bash_aliases
fi




export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -lah"

# PS1 name on terminal
export PS1="%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "


# autosugestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
