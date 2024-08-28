if [[ -d $(brew --prefix) ]]; then
    #syntax higliting
    if [[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
        source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    else
        echo "Syntax hylighting not installed"
    fi

    # autosugestions
    if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
        source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    else
        echo "Autosuggestions not installed"
    fi

    # brew branch visualization, installed with brew romkatv/gitstatus/gitstatus
    # github https://github.com/romkatv/gitstatus
    # left prompt :PROMPT
    # right prompt: RPROMPT

    MY_PROMPT="%n@%m:%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "
    # echo $1
    if [[ -f $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh ]]; then
        source $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh
        PROMPT=$MY_PROMPT
        # PROMPT=$1
        RPROMPT='$GITSTATUS_PROMPT'

    else
        # PS1 name on terminal
        export RPROMPT=$MY_PROMPT

    fi

    #brew ruby-install
    source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
    source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
    chruby ruby-3.1.3

    # PYQT5 homebrew
    export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
    export PATH="/opt/homebrew/opt/pyqt@5/5.15.4_1/bin:$PATH"

    # SVM
    export SVN_EDITOR=vim

    PATH=$PATH:/usr/local/texlive/2023/bin/universal-darwin
    export PATH="/usr/local/anaconda3/bin:$PATH"


    # brew util-linux
    export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"
    export PATH="/opt/homebrew/opt/util-linux/sbin:$PATH"

    export LDFLAGS="-L/opt/homebrew/opt/util-linux/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/util-linux/include"

    #virtualenv and virtualenvwrapper (mac)
    if [ -d $HOME/.virtualenvs ]; then
        export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
        export VIRTUALENVWRAPPER_VIRTUALENV=/opt/homebrew/bin/virtualenv
        source virtualenvwrapper.sh
        export WORKON_HOME=$HOME/.virtualenvs
        export PROJECT_HOME=$HOME/Developer

    else
        echo "Virtualenv and virtualenvwerapper not installed in the following path: $HOME/.virtualenvs"
    fi

else
    echo "Brew not installed"
fi