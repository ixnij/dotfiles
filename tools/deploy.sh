#!/usr/bin/env zsh 

CONFIGROOT=".."

if [ -e "~/.zshrc" ] && [ -e "~/.zshrc.local" ]; then 
	echo "There's already has zsh configuration files." >> /dev/stderr
elif [ -e "~/.zshrc.local" ]; then 
	curl -Lo .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc	
else
	curl -Lo .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
	ln -s ${CONFIGROOT}/zsh/zshrc.local ~/.zshrc.local  
fi
