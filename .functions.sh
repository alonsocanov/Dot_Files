function create(){
    # cd $HOME/Developer
    DIR="$HOME/Developer/$1"
    if [[ ! -d "$DIR" ]]; then
        echo "Creating $DIR"
        mkdir "$DIR"
        echo "Changing directory"
        cd "$DIR"
        echo "Adding README.md"
        touch "README.md"
        echo "Creating .gitignore"
        touch ".gitignore"
        echo '*.DS_Store' >> .gitignore
        echo '*__pycache__*' >> .gitignore
        echo '*.vscode*' >> .gitignore
        open https://github.com/new
        git init
        git add .
        git commit -m "First Commit"
        git push -u origin master
    else
        echo "This path already exists $DIR"
    fi
}
