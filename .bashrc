# virtual  environment with virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#source /usr/local/bin/virtualenvwrapper.sh
#export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin

# If file with aliases exists
if [ -f ./.bash_aliases ]; then
    . ./.bash_aliases
fi



if [[ $? == 0 ]]; then
    export PS1="\[\033[33m\]\W\\ \[\033[1;34m\]>\[\033[1;31m\]>\[\033[1;33m\]>\[\033[37m\] "
else
    export PS1="\[\033[00m\]\W\\ \[\033[1;34m\]>\[\033[1;31m\]>\[\033[1;33m\]>\[\033[37m\] "
fi

