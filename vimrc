set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'micha/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dense-analysis/ale'
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
map <C-n> :NERDTreeToggle<CR>

set smartindent
set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
