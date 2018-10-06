call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'elmcast/elm-vim', {'for': 'elm'}
Plug 'w0rp/ale'

call plug#end()

" Nerd tree Config
map <C-\> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

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

" ALE config
let g:ale_fixers = {
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['eslint', 'tslint']
      \}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_linters = {
\  'javascript': ['flow']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = '😡' " could use emoji
let g:ale_sign_warning = '🤔' " could use emoji
let g:ale_statusline_format = ['😡 %d', '🤔 %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Default settings {
let mapleader = ","
set nocompatible
syntax enable
set background=dark
set expandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set list
set hlsearch
" set colorcolumn=120
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
set term=screen-256color

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
