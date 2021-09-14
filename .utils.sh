# this sh file aims to handle virtual environments and install them it if needed

#virtualenv and virtualenvwrapper
if [ ! -d $HOME/.virtualenvs ]; then
    echo "Virtualenv and virtualenvwerapper not installed, the following path: $HOME/.virtualenvs does not exist"
    sudo pip3 install virtualenv
    sudo pip3 install virtualenvwrapper
    if [ ! -d $HOME/.virtualenvs ]; then
        mkdir $HOME/.virtualenvs
    fi
fi
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_ENV_BIN_DIR=bin



# ROS
ROS_PATH=/opt/ros/melodic/setup.bash
if [ -f  $ROS_PATH ]; then
    source /opt/ros/melodic/setup.bash
    export ROS_MASTER_URI=http://localhost:11311
    export ROS_IP=192.168.1.155
    export LD_LIBRARY_PATH=/usr/local/lib:/opt/ros/melodic/lib
elif [ ! -f $HOME/.zshrc ] &&  [ -f $HOME/.bash ]; then
    echo "Could not find $ROS_PATH"
fi
