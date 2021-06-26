eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.sjtug.sjtu.edu.cn/git/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.sjtug.sjtu.edu.cn/git/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.sjtug.sjtu.edu.cn/homebrew-bottles/bottles"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
