{ pkgs }:

with pkgs; [
  bat
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
  iosevka-bin
  neofetch
  httpie
  # chez
  # Em.. It seems like chez doesn't support Apple m1
  cachix
  tree
  # librime
]
