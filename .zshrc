# Ixaya SVN
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.bin
export SVN_EDITOR=vim

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# git
alias gs="git status"
alias g="git"
alias gl="git log --all --graph --decorate --onelin --oneline"
alias gb="git branch -vv"
alias gd="git diff"


# ls
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -lah"

# PS1 name on terminal
export PS1="%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "


# autosugestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
