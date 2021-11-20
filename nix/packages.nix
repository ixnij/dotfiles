{ pkgs }:

with pkgs; [
  bat
  emacsGcc
  #	emacsMacport
  ripgrep
  guile
  stow
  fd
  sbcl
#  mitscheme
#  tinyscheme
  ghc
  htop
  cloc
  ffmpeg
  wget
  tmux
  exa 
  fira-code
  neofetch
  httpie
  # chez
  # Em.. It seems like chez doesn't support Apple m1
  #	freshfetch
  # cachix
  tree
  # librime
  jq
]
