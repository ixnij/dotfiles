**`zshrc` is from [grml-etc-core](https://github.com/grml/grml-etc-core).**

WARING: PLEASE NOTE THAT YOU MIGHT OVERRIDE EXISTING CONFIGUTATION FILES IN THE CURRENT WORKING DIRECTORY.

```sh
wget -O .screenrc     https://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic
wget -O .tmux.conf    https://git.grml.org/f/grml-etc-core/etc/tmux.conf
wget -O .vimrc        https://git.grml.org/f/grml-etc-core/etc/vim/vimrc
wget -O .zshrc        https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
```

```sh
curl -Lo .screenrc    https://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic
curl -Lo .tmux.conf   https://git.grml.org/f/grml-etc-core/etc/tmux.conf
curl -Lo .vimrc       https://git.grml.org/f/grml-etc-core/etc/vim/vimrc
curl -Lo .zshrc       https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
```

>Further information is available from https://grml.org/console/

<details>
<summary>reason of zshrc.local</summary>
我不希望我自己添加的 zsh 配置污染了 grml 的配置。
所以为了区分，还是添加了一个 `zshrc.local` 用于存放个人的配置文件。
</details>

~~Now, I'm using `spaceship` as my prompt.~~ 

~~I'm using `starship` now. (It's written in rust)~~ 

~~using spaceship now.~~

I'm using `Powerlevel10k` now. It's powerful.

Some Awesome repositories & articles about zsh:

[zshGuide](https://github.com/goreliu/zshguide)

[ArchWiki-zsh](https://wiki.archlinux.org/title/Zsh)

[Star-ship(SHELL prompt)](https://github.com/spaceship-prompt/spaceship-prompt#features)
