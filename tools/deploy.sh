#!/usr/bin/env zsh 

CONFIGROOT=".."


# For zshrc

if [ -e "~/.zshrc" ] && [ -L "~/.zshrc.local" ]; then 
	echo "There's already has zsh configuration files." >> /dev/stderr
elif [ -L "~/.zshrc.local" ]; then 
	curl -Lo .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc	
else
	curl -Lo .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
	ln -sf ${CONFIGROOT}/zsh/zshrc.local ~/.zshrc.local  
fi


