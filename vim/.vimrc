set autoindent
set nu
imap fd <Esc>
syntax on
set clipboard=unnamedplus
set encoding=utf-8
set ruler

set wrap
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set noexpandtab
set noshiftround
setglobal modeline

set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sleuth'
Plug 'Valloric/YouCompleteMe'

call plug#end()
let g:airline_theme='base16'
