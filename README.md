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
For the vim config file, you should create the `~/.vimrc` file and you need to write a sentence like this: 

```bash
source ~/.vim/init.vim
```

There are some articles worth referring to about the way of backing up configuration files:
- [The best way to store your dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

# Why?

## Why I back up my configuration file to Github

Of course, no one is willing to spend a lot of time and energy on the configuration file to 
lose in vain (I once built an Emacs configuration file locally, I spent quite a while to 
improve it, but I did not think of my own The computer will have problems and cause me to
lose these files. Naturally, I have no idea of backing up the configuration files, even
though my configuration files are very inelegant and clumsy). Moreover, since there is a
way to back up the configuration files you have accumulated, why not do it?

## Why using GNU/stow ?

If I just create symbolic links, I don't seem to need to use a 
dedicated manager to manage my configuration files. However, it is 
very convenient, which means that it can deploy configuration files as 
quickly as yadm, and is more flexible (I know that yadm can implement 
some functions through hooks), and it can quickly create and delete 
symbolic links.

Of course, stow has written in perl.

Come with a complete git tutorial: [git tutorial](https://www.liaoxuefeng.com/wiki/896043488029600/)

