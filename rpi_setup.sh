
PACK_PATH=$HOME/$pwd/.packages.sh
if [ -f $PACK_PATH ]; then
    . $PACK_PATH
else
    echo "File could not be found $PACK_PATH"
fi


# install opencv 4
echo "Installin OpenCV 4"
echo "Expand file system in Advance->Expand File System"
sudo raspi-config
echo "Reboot sytem"
echo "Checking File system expansion"
df -h
echo "Delete both LibreOffice and Wolfram engine to free up some space"
sudo apt-get purge wolfram-engine
sudo apt-get purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove
echo "Updating and Upgrading"
sudo apt-get update && sudo apt-get upgrade
echo "Installin deveeloper tools"
sudo apt-get install build-essential cmake pkg-config
echo "Installing Image packages"
sudo apt-get install build-essential cmake pkg-config
echo "Installing video packages"
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
echo "Installin the GTK development library"
sudo apt-get install libfontconfig1-dev libcairo2-dev
sudo apt-get install libgdk-pixbuf2.0-dev libpango1.0-dev
sudo apt-get install libgtk2.0-dev libgtk-3-dev
echo "Installing matrix opeertation optimization"
sudo apt-get install libatlas-base-dev gfortran
echo "HDF5 datasets and Qt GUIs"
sudo apt-get install libhdf5-dev libhdf5-serial-dev libhdf5-103
sudo apt-get install libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5
echo "Install Python 3"
sudo apt-get install python3-dev
echo "Installing Pip"
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py
sudo rm -rf ~/.cache/pip
echo "Installing virtualenv and virtualenvwrapper"
sudo pip3 install virtualenv virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
echo "Checking virtual environment"
if [ ! -d $HOME/.virtualenvs ]; then
    mkdir $HOME/.virtualenvs
fi
if [ ! -d $HOME/.virtualenvs/py3]; then
    mkvirtualenv py3 -p python3
fi
echo "Activation virtual environment py3"
workon py3
echo "Installing RPI Camara API"
pip3 install "picamera[array]"
echo "Downloading OpenCV"
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.1.1.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.1.1.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.1.1 opencv
mv opencv_contrib-4.1.1 opencv_contrib