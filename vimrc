set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

set directory^=$HOME/.vim/swap//

set visualbell
syntax on
set relativenumber

set colorcolumn=80

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

map <F2> :nohl<CR>

set smartindent
set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start
