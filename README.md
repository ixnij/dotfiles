# How to?
I'm using GNU's stow to manage my configuation files.
Check out the usage of `stow` through `man stow`.

For example,you can use the following commands to make a symbol link to `~/.config/nvim`
from this directory.

```bash
stow --target="~" --dir="." nvim
```
or

```bash
stow --target="~/.config" --dir="." nvim
```

You can also:

```bash
stow --target="~/.vim" --dir="." vim
```
For the vim config file, you should create the `~/.vimrc` file and you need to write a sentence like this: `source ~/.vim/init.vim`.

There are some articles worth referring to about the way of backing up configuration files:
- [The best way to store your dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

# Why?

Of course, no one is willing to spend a lot of time and energy on the configuration file to 
lose in vain (I once built an Emacs configuration file locally, I spent quite a while to 
improve it, but I did not think of my own The computer will have problems and cause me to
lose these files. Naturally, I have no idea of backing up the configuration files, even
though my configuration files are very inelegant and clumsy). Moreover, since there is a
way to back up the configuration files you have accumulated, why not do it?

Come with a complete git tutorial: [git tutorial](https://www.liaoxuefeng.com/wiki/896043488029600/)
