if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
" FZF vim integrationscreen"
Plug 'junegunn/fzf'
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Default settings (
" Share same clipboard across Linux, Windows and Mac OS X
set clipboard+=unnamedplus
set hidden
" Some servers have issues with backup files.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set termguicolors
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=yes
set relativenumber
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set noshowmode
set list
set lazyredraw
set ttyfast
let mapleader = ","
set vb t_vb=     " no visual bell & flash
set nocompatible
set background=dark
set expandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set hlsearch
set incsearch
set showmatch
set noswapfile
set smartcase
set ignorecase
set autoindent
set smartindent
set ruler
set undolevels=1000
set backspace=indent,eol,start
set matchtime=0
set splitbelow
set splitright
colorscheme gruvbox
syntax enable
let g:airline_theme='gruvbox'
set t_Co=256
nnoremap <silent> <Leader> :WhichKey ","<CR>
noremap <leader>b :Buffers<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Save files automatically when the focus is lost.
autocmd BufLeave,FocusLost * silent! wall

" Performance improvements for mac (
if has("mac")
  set nocursorline

  if exists("+relativenumber")
    set norelativenumber
    set number
  endif

  set foldlevel=0
  set foldmethod=manual
endif
" )


" Nerd tree Config (
map <C-\> :NERDTreeToggle<CR>
" )

" Airline config (
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 0
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
" )

" Fold settings (
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99
set conceallevel=0
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
" )

com! FormatJSON %!python -m json.tool

if executable('fzf')
  " You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10new' }
  let g:fzf_layout = { 'down': '30%' }
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
  nnoremap <silent> <C-p> :GFiles<cr>
  nnoremap <silent> <C-t> :Files <cr>
  let g:fzf_history_dir = '~/.local/share/fzf-history'
else
  " CtrlP fallback
end
" ) Default settings
