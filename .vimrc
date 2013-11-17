execute pathogen#infect()
"mapleader interferes with slimv
"let mapleader = ","
set clipboard=unnamedplus

cmap w!! w !sudo tee % >/dev/null
set encoding=utf-8

set hlsearch
set incsearch
"set hidden

set wildmenu
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set backspace=indent,eol,start

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <M-o> <C-o>o
inoremap <M-O> <C-o>O

vnoremap < <gv
vnoremap > >gv

syntax on
filetype plugin indent on

""""""""""""""""""""""""""""""
" Plugin-specific
""""""""""""""""""""""""""
let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/emacs/site-lisp/slime/start-swank.lisp &'
nnoremap <Leader>u :GundoToggle<CR>

"YouCompleteMe
":h 'complete'
set complete=.,i,b,u,]

""""""""""""""""""""""""""""""
" generic Leader bindings
""""""""""""""""""""""""""""""
nmap <Leader>n :bp<CR>
nmap <Leader>m :bn<CR>
nmap <silent> <Leader>ev :e ~/.vimrc<CR>
nmap <silent> <Leader>sv :so ~/.vimrc<CR>
nmap <silent> <Leader>/ :noh<CR>
nmap <Leader>d :e <C-r>=getcwd()<CR><CR>
nmap <Leader>r q:z1<CR>i

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""
set list listchars=tab:\ \ ,trail:·
set autoread
set visualbell
set number
set nowrap
set showcmd
set cul
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
"set cindent
