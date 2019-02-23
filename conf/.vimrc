" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" git clone https://github.com/VundleVim/Vundle.vim.git
" :PluginInstall
" :PluginUpdate

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'dracula/vim'

call vundle#end()            " required
filetype plugin indent on    " required

set nu
set backspace=indent,eol,start
set tabstop=8 
set softtabstop=0 
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set mouse=a
set completeopt-=preview
set hlsearch
"set cursorline


:colorscheme desert 
:syntax on
:vertical resize -37
":vertical :botright :terminal

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
  autocmd VimEnter * wincmd p
augroup END

set t_Co=256 " 256 colors in terminal

set encoding=utf8
