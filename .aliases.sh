#Helpful aliases


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias ll="ls -alF --color=auto"
    alias la="ls -A --color=auto"
    alias l="ls -CF --color=auto"
    alias ls="ls -alh --color=auto"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ll="ls -alF"
    alias la="ls -A"
    alias l="ls -CF"
    alias ls="ls -alh"
fi

#ls
# alias ll="ls -alF"
# alias la="ls -A"
# alias l="ls -CF"
# alias ls="ls -alh"
# git
alias gits="git status"
alias gitl="git log --all --graph --decorate --oneline"
alias gitb="git branch -vv"
alias gitd="git diff"
