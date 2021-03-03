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

    MY_PROMPT="%(!.%F{white}.%F{orange})%1//%f%B%(0?.%F{green}-%f.%F{red}!%f)%F{blue}>%f%F{red}>%f%F{yellow}>%f%b "
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
else
    echo "Brew not installed"
fi