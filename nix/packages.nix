{ pkgs }:

with pkgs; [
  bat
  #	emacsMacport
  ripgrep
  guile
  stow
  fd
  sbcl
  #  mitscheme
  #  tinyscheme
  ghc
  stack
  pandoc
  htop
  cloc
  ncdu
#  webkit # emacs with xwidget depends it
  llvm
  coreutils
#  python39Packages.pyqt5_with_qtwebkit
  less
  ffmpeg
  wget
  tmux
  exa 
  iosevka
  fira-code
  jetbrains-mono
  neofetch
  httpie
  emacsGcc
  # chez
  # Em.. It seems like chez doesn't support Apple m1
  #	freshfetch
  # cachix
  tree
  # librime
	jq
]
