# .files

This are some of my configurations for bash, zsh and vim.

## Symlink
In order to keep everything neat [symbolic links](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/) must be created. In the terminal from your home directory you must create symbolic links in order find the configuration files.    
By runnig the symbolic links when a file is called, this will forward it to the path in which the files are stored. In my case I created a directory *.files* in my home folder. It is important to create the symbolic link in the home folder.  
Keep in mind that you are using either bash or zsh.


```bash
ln -s path_to/.files/.zshrc .zshrc
ln -s path_to/.files/.bashrc .bashrc
ln -s path_to/.files/.vim .vim
ln -s path_to/.files/.bash_aliases .bash_aliases
```
Here is an example form my home directory.  

```bash
ln -s .files/.zshrc .zshrc
ln -s .files/.bashrc .bashrc
ln -s .files/.vim .vim
ln -s .files/.bash_aliases .bash_aliases
```
