#!/usr/bin/env zsh 

if [ -e "~/.zshrc" ] || [ -e "~/.zshrc.local" ]; then 
	echo "There's no any zshrc."
else
	echo "There's already has zsh configuration files."
fi

case $(uname) in
	FreeBSD) echo "FBSD" ;;
	Darwin) echo "Darwin - xnu";;
	Linux) echo "Linux";;
	*) ;;
esac
