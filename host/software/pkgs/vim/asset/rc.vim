syntax enable
filetype plugin indent on

colorscheme akr

set encoding=utf-8
set showcmd
set nocompatible
set nocursorline
set number
set lazyredraw
set ttyfast
set mouse=a
set t_Co=256
set shell=/bin/sh
set sessionoptions-=options

set directory=~/.vim/swap//,.

set undofile
set undodir=~/.vim/undo

set wrap
set tabstop=4 shiftwidth=4
set backspace=indent,eol,start
set linebreak

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildchar=<Tab> wildmenu wildmode=full

let mapleader=","

map <leader>s  :let @/=""<CR>
map <leader>c  zz
map <leader>d  <c-]>

nmap <backspace> :e#<CR>
nmap f           za
nmap F           zA

" disable to override default on neovim
set noautoread

autocmd InsertEnter *   :setlocal nohlsearch
autocmd InsertLeave *   :setlocal hlsearch

autocmd FileType scheme  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType lisp    setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType racket  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType haskell setlocal shiftwidth=2 tabstop=4 softtabstop=2 shiftround expandtab
autocmd FileType pandoc  setlocal nonumber autoread
autocmd FileType pandoc  let      g:airline#extensions#whitespace#checks=['indent', 'trailing', 'long']
autocmd FileType tex     set      conceallevel=2

nnoremap <C-Tab>   :bnext<CR>
nnoremap <C-S-Tab> :bprev<CR>

" select previous line on file reload, useful when cycling file extensions
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\" zz" | endif
nnoremap <Tab> :CounterpointNext<CR>
nnoremap <S-Tab> :CounterpointPrevious<CR>

nnoremap <C-left>  gT
nnoremap <C-right> gt
nnoremap <space> @q
nnoremap J }
nnoremap K {

nmap <Left>  <<
nmap <Right> >>
vmap <Left>  <gv
vmap <Right> >gv

nmap <Up>   [e
nmap <Down> ]e
vmap <Up>   [egv
vmap <Down> ]egv

nnoremap <A-left>  <C-W>h
nnoremap <A-right> <C-W>l
nnoremap <A-up>    <C-W>k
nnoremap <A-down>  <C-W>j

set laststatus=2
let g:airline_theme                                   = 'akr'
let g:airline#extensions#tabline#enabled              = 1
let g:airline#extensions#tabline#show_buffers         = 1
let g:airline#extensions#tabline#show_tab_type        = 1
let g:airline#extensions#tabline#fnamemod             = ':t'
let g:airline#extensions#tabline#formatter            = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode      = 0
let g:airline#extensions#tabline#show_close_button    = 0
let g:airline#extensions#tabline#show_splits          = 0
let g:airline#extensions#tabline#show_tab_nr          = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 2

let g:gitgutter_enabled         = 0
let g:gitgutter_highlight_lines = 1

let g:goyo_width                = 90
let g:goyo_margin_top           = 1
let g:goyo_margin_bottom        = 0

nnoremap <F5> :MundoToggle<CR>
nnoremap <F6> :GitGutterToggle<CR>
nnoremap <F7> :SignatureToggleSigns<CR>
nnoremap <F8> :Goyo<CR>

nnoremap <c-b> :CtrlPBuffer<CR>
nnoremap <c-m> :CtrlPMixed<CR>
nnoremap <c-t> :CtrlPTag<CR>
nnoremap <a-t> :CtrlPBufTag<CR>

let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$',
\ 'file': '\.o$\|\.d$'
\ }

let g:undotree_SetFocusWhenToggle = 1

let g:localvimrc_sandbox    = 0
let g:localvimrc_persistent = 2

let g:wordmotion_prefix = '<Leader>'
