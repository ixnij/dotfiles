#!/usr/bin/env zsh
### Filename: deploy.sh 
### Author: Thomas Wu <ixnij.wu@outlook.com>
### TODO: sh -> py

ZSHRC="$HOME/.zshrc"
if [[ ! -f "$ZSHRC" ]]; then
	wget -O .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
#else
#	mv $ZSHRC $ZSHRC.bak
#	wget -O .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
fi
