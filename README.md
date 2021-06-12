# How to?

I'm using GNU's stow to manage my configuation files.
You can check out the usage of `stow` through `man stow`.

I usually let the repository named `~/.files` locally.

If you just want to give it a try without any other actions, you can use this command to speed up the cloning process:

```bash
git clone --depth=1 https://github.com/ixnij/dotfiles.git ~/.files
```

For example, you can use the following commands to make a symbol link to `~/.config/nvim`
from this directory.

```bash
stow --target="~" --dir="." nvim
```
or

```bash
stow --target="~/.config" --dir="." nvim
```
## Vim

```bash
stow --target="~/.vim" --dir="." vim
```
For the vim config file, you should create the `~/.vimrc` file and you need to write a sentence like this: 

```bash
source ~/.vim/init.vim
```

## Neovim

```bash
stow --target="~" --dir="." nvim
```
or

```bash
stow --target="~/.config" --dir="." nvim
```
## Emacs

```bash
stow --target="~/.emacs.d" emacs
```
**Note**: 
>Emacs 27.1
Released Aug 10, 2020
Emacs 27.1 has a wide variety of new features, including:

>Built-in support for arbitrary-size integers
Text shaping with HarfBuzz
Native support for JSON parsing
Better support for Cairo drawing
Portable dumping used instead of unexec
Support for XDG conventions for init files
Additional early-init initialization file
Built-in support for tab bar and tab-line
Support for resizing and rotating of images without ImageMagick

Yes, Since Emacs 27, emacs follows XDG standard. you can put the configuration file in `~/.config/emacs`, Like
many other programs such as `neovim` and so on.

So you have another way to deploy the emacs configuration file:

```bash
stow --target="~/.config/emacs" emacs
```

There are some articles worth referring to about the way of backing up configuration files:
- [The best way to store your dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

# Why?

There are some reasons and ideas about this repository.

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

~~Come with a complete git tutorial: [git tutorial](https://www.liaoxuefeng.com/wiki/896043488029600/)~~

# Note:

After a period of use and testing, this configuration file repository 
can run normally on Linux distributions such as openSUSE Tumbleweed, 
gentoo rootfs, archlinux and debian.
**But this usually has nothing to do with the release.**
