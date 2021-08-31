# Intro

**Don't use my zshrc. Use grml's zshrc.**

```sh
wget -O .screenrc     https://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic
wget -O .tmux.conf    https://git.grml.org/f/grml-etc-core/etc/tmux.conf
wget -O .vimrc        https://git.grml.org/f/grml-etc-core/etc/vim/vimrc
wget -O .zshrc        https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
```

The grml's configuretion file repository: [grml-etc-core](https://github.com/grml/grml-etc-core)

>Further information is available from https://grml.org/console/

~~I'm using starship now.~~

For fzf, you may should run

```zsh
$(brew --prefix)/opt/fzf/install
```
To install shell functions.

Some Awesome repositories & articles about zsh:

- [zshGuide](https://github.com/goreliu/zshguide)

- [ArchWiki-zsh](https://wiki.archlinux.org/title/Zsh)

- [Star-ship(SHELL prompt)](https://github.com/spaceship-prompt/spaceship-prompt#features)

- [spaceship-prompt](https://spaceship-prompt.sh/zh/getting-started/)
