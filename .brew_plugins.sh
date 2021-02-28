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
else
    echo "Brew not installed"
fi