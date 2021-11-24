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
  pandoc
  htop
  cloc
  ffmpeg
  wget
  tmux
  exa 
  sarasa-gothic
  fira-code
  jetbrains-mono
  neofetch
#  emacsGit
  httpie
  # chez
  # Em.. It seems like chez doesn't support Apple m1
  #	freshfetch
  # cachix
  tree
  # librime
  jq
]
