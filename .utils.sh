# this sh file aims to handle virtual environments and install them it if needed

#virtualenv and virtualenvwrapper (mac)
if [ -d $HOME/.virtualenvs ]; then
    # export WORKON_HOME=$HOME/.virtualenvs
    # export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    # export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    # source /usr/local/bin/virtualenvwrapper.sh
    # export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin

    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.8
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
    export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin

else
    echo "Virtualenv and virtualenvwerapper not installed in the following path: $HOME/.virtualenvs"
fi
