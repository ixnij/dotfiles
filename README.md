# Dotfiles

```console
o-o  o-O-o o   o o--o  o    o--o     o--o o   o   O    o-o  o-o
|       |   |\ /| |   | |    |        |    |\ /|  / \  /    |
 o-
	|   |   |   | |     |    |        |    |   | |   | \        |
o--o  o-O-o o   o o     O---oo--o     o--o o   o o   o  o-o o--o
```

## Emacs

### Requirements

* `stow`
* `SF Mono`
* `emacs`>= 29 with patches from emacs-plus

### Quickstart

```console
$ stow ${repository}/emacs -t ~/.emacs.d/ # make sure your ~/.emacs.d/ exists
$ emacs --daemon
```

As all-the-icons-font:

<kbd>M-x package-install RET all-the-icons</kbd> then <kbd>M-x all-the-icons-install-fonts</kbd>

They are required by `all-the-icons-ibuffer` and `all-the-icons-dired`.
