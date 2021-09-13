eval `ssh-agent -s`

SSH_GIT=$HOME/.ssh/github
if [ -f SSH_GIT]; then
    ssh-add SSH_GIT
fi