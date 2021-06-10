
" For vim-plug:

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.staticdn.net/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number
set nocompatible
syntax on
set showmode
set showcmd
set autoindent
set cindent
set ruler
set ignorecase
set smartcase
set cursorline
set relativenumber
" set softtabstop=2
set expandtab
set shiftwidth=4
" set tabstop=2
set autoindent
filetype indent on
set t_Co=256
set encoding=utf-8  
set mouse=a

