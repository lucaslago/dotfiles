if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

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

set termguicolors
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set relativenumber
set number
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set clipboard=unnamed
set noshowmode
set nolist
set lazyredraw
set ttyfast
let mapleader = ","
let g:blamer_enabled = 1
set vb t_vb=     " no visual bell & flash
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
set splitbelow
set splitright
" Performance improvements for mac
if has("mac")
  set nocursorline

  if exists("+relativenumber")
    set norelativenumber
  endif

  set foldlevel=0
  set foldmethod=manual
endif

" COC CONFIG {
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>d :CocList diagnostics<CR>
noremap <leader>a :CocAction <CR>
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> <Leader> :WhichKey ","<CR>

" } COC CONFIG

" Nerd tree Config
map <C-\> :NERDTreeToggle<CR>

" Airline config
let g:airline_powerline_fonts = 1
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0
" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 0
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1

set nocompatible
syntax enable
set background=dark
set expandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set list
set hlsearch
set incsearch
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
let g:airline_theme='gruvbox'
set t_Co=256

" Save files automatically when the focus is lost.
autocmd BufLeave,FocusLost * silent! wall
" }

" Fold settings {
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=99
set conceallevel=0
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

if executable('fzf')
  " You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10new' }
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

else
  " CtrlP fallback
end

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
