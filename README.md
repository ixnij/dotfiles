# Intro

This repository is used to store my configuration files.

Now, I'm using Nix as my package manager on macOS.

The font I use: SF Mono & Jetbrains Mono & Fira Code & Cascadia Code.

## Deployment

by using symbol link.
You can also use GNU stow to set up symbolic links in batches.

In my opinion, using symbol link is the best way to deploy configuretion files. As for the reason, I think smart readers have guessed it.

I also set up some scripts to help deploy files. And, you'd better use absolute paths to set up symbol links.

Sample:

```zsh
cd /path/to/this/repo
ln -s $(pwd)/vim/init.vim $HOME/.vimrc
```

using GNU/stow:

```zsh
cd /path/to/this/repo
stow emacs -t ~/.emacs.d
```

Note: the `~/.emacs.d` or `~/.config/emacs` directory must be exist.

## About Nix

Nix is a pure functional package manager. But, It's not easy for newer macOS with apfs to install it.

## Requirement

There're some useful tools and I've configured for them.

- `Fzf` : File finder (written in go)
- `Ripgrep` : For search (written in rust)
- `Fd` : Finder (written in rust)
- `Brew` : Package manager (written in ruby)
- `Bat` : A substitute of cat (written in rust)
- `Neovim` : Text editor (written in C)
- `GNU's Emacs` : Text editor (written in Lisp)
- `Zoxide` : Awesome, (written in rust)
- `Starship` : My zsh prompt (written in rust)
- `Nix-*` : Package manager (written in c++)
- `Pkg-src ` : Package manager (written in c)
- `iTerm2` : The best Terminal in macOS (written in Obj-c and swift)
- `Powerline-go` : Awesome, It's my new prompt (written in golang).
