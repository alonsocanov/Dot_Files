if [[ ! -d $(brew --prefix) ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi
if [[ -d $(brew --prefix) ]]; then
    brew install $(<brew_packages.txt)
fi
