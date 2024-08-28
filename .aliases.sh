#Helpful aliases


# enable color support of ls and also add handy aliases
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls="ls -alh --color=auto"
alias ll="ls -alF --color=auto"
alias la="ls -A --color=auto"
alias l="ls -CF --color=auto"

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'



# git
alias gits="git status"
alias gitl="git log --all --graph --decorate --oneline"
alias gitb="git branch -vv"
alias gitd="git diff"
alias gitc="git commit -m"
