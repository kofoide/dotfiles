set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'tmhedberg/SimpylFold'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'scrooloose/syntastic'
Bundle 'nvie/vim-flake8'

call vundle#end()

filetype plugin indent on  " required!

" shows row and column number at bottom right corner
set ruler

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag python whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" Syntax Highlighting
let python_highlight_all=1
syntax on

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme solarized 
endif
