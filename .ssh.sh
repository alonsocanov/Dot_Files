eval `ssh-agent -s`

if [ -f $HOME/.ssh/github]; then
    ssh-add github
fi