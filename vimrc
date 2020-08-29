
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
 set termguicolors

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'APZelos/blamer.nvim'
Plug 'liuchengxu/vim-which-key'


call plug#end()

" Nerd tree Config
map <C-\> :NERDTreeToggle<CR>

" Airline config
let g:airline_powerline_fonts = 1

" simple separators for buffer list
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0
" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 0
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1


" Default settings {
let mapleader = ","
set nocompatible
syntax enable
set background=dark
set expandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set hlsearch
set incsearch
set textwidth=100
set showmatch
set noswapfile
set smartcase	
set ignorecase
set autoindent
set smartindent
set smarttab

set ruler
set undolevels=1000
set backspace=indent,eol,start
set matchtime=0

colorscheme gruvbox
set t_Co=256

" Save files automatically when the focus is lost.
autocmd BufLeave,FocusLost * silent! wall
" }

" Fold settings {
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
" }

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

com! FormatJSON %!python -m json.tool

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
