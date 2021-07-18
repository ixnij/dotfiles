
" For vim-plug:

" if empty(glob('~/.vim/autoload/plug.vim'))
"	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"				\ https://raw.staticdn.net/junegunn/vim-plug/master/plug.vim
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" Vim Plugin settings: (using vim-plug as plugin manager)
" call plug#begin('~/.vim/plugged')
" 
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'lifepillar/vim-solarized8'
" Plug 'morhetz/gruvbox'
"  Plug 'jiangmiao/auto-pairs'
" 
" call plug#end()

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
set wildmenu " For vim command mode auto completion
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

" Color scheme:

set background=dark
" set background=light
colorscheme gruvbox

" Airline settings:

" let g:airline_powerline_fonts = 1  
" let g:airline#extensions#tabline#enabled = 1     
" let g:airline#extensions#tabline#left_sep = ' '   
" let g:airline#extensions#tabline#left_alt_sep = '|'      
" let g:airline#extensions#tabline#buffer_nr_show = 1
" 
" Key map settings:

nnoremap <Tab> :bn<CR>
nnoremap <s-Tab> :bp<CR>
nnoremap <s-q> :q!<CR>
nnoremap <c-s> :w<CR>
