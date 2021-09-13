LIST=("vim" "htop" "expect" "nmap")
DIR_PATH=$HOME/$(dirname $(readlink $HOME/.bashrc))
apt -qq LIST | grep -v "installed" | awk -F/ '{print $1}' > DIR_PATH/packages.txt
packages=$(cat DIR_PATH/packages.txt)
grep -q '[^[:space:]]' < DIR_PATH/packages.txt
EMPTY_FILE=$?
if [[ $EMPTY_FILE -eq 1 ]]; then
    echo "Nothing to do"
else
    apt-get  install -y $packages
fi