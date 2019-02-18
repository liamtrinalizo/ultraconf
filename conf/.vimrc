" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" git clone https://github.com/VundleVim/Vundle.vim.git
" :PluginInstall
Plugin 'VundleVim/Vundle.vim'

" Airline
Plugin 'vim-airline/vim-airline'

" Airline themes
Plugin 'vim-airline/vim-airline-themes'

" Themes
"Plugin 'dracula/vim'

" YouCompleteMe - autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

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
set cursorline
set completeopt-=preview

let g:ycm_global_ycm_extra_conf = "~/University/.ycm_extra_conf.py"

:colorscheme delek "dracula
:syntax on
":vertical :botright :terminal
:vertical resize -37

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

set t_Co=256 " 256 colors in terminal

set encoding=utf8
