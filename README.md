# Intro

This repository is used to store my configuration files.

## Deployment

by using symbol link.
You can also use GNU stow to set up symbolic links in batches.

In my opinion, using symbol link is the best way to deploy configuretion files. As for the reason, I think smart readers have guessed it.

I also set up some scripts to help deploy files. And, you'd better use absolute paths to set up symbol links.

Sample:

```zsh
cd /path/to/this_repo
ln -s $(pwd)/vim/init.vim $HOME/.vimrc
```

## Requirement

There're some useful tools and I've configured for them.

- `Fzf` : file finder (written in go)
- `Ripgrep` : for search (written in rust)
- `Fd` : finder (written in rust)
- `Brew` : package manager (written in ruby)
- `Bat` : A substitute of cat (written in rust)
- `Neovim` : text editor (written in C)
- `GNU's Emacs` : text editor (written in Lisp)
- `Zoxide` : awesome, wriiten in rust.
- `Starship` : My zsh prompt (wriiten in rust)
- `Nix-*` : package manager, wriiten in c++
- `pkg-src ` : package manager written in c
