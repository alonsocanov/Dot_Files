LIST=("vim htop tmux fail2ban")
for package in $LIST
do
   dpkg -s $package &> /dev/null 
   if [ $? -ne 0 ]; then
       echo "$package is not installed installing"
       sudo apt install -y $package
   fi
done

