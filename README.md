[TOC]

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
