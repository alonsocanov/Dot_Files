# this sh file aims to handle virtual environments and install them it if needed

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


# ROS
if [ -f /opt/ros/melodic/setup.bash ]; then
    source /opt/ros/melodic/setup.bash
    export ROS_MASTER_URI=http://localhost:11311
    export ROS_IP=192.168.1.155
    export LD_LIBRARY_PATH=/usr/local/lib:/opt/ros/melodic/lib
elif [[ ! -f $HOME/.zshrc ] && [ -f $HOME/.bash ]]; then
    echo "Could not find /opt/ros/melodic/setup.bash"
fi