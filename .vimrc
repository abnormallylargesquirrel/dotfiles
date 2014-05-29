execute pathogen#infect()

"set clipboard=unnamedplus

set tags=./tags;/

set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase
"set hidden

set undofile
set undodir=~/.vimundo

set wildmenu
set backspace=indent,eol,start

set noesckeys

let mapleader=" "

""""""""""""""""""""""""""""""
" Random mappings
""""""""""""""""""""""""""""""
" {{{
cnoremap w!! w !sudo tee % >/dev/null
inoremap jk <Esc>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Q @@

inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <M-o> <C-o>o
inoremap <M-O> <C-o>O
inoremap <M-b> <C-o>b
inoremap <M-f> <C-o>w
" }}}

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
" {{{
syntax on
filetype plugin indent on

if has("gui_running")
    set background=dark
    "colorscheme solarized
    colorscheme mustang
endif
" }}}

""""""""""""""""""""""""""""""
" Plugin-specific
""""""""""""""""""""""""""""""
" {{{
let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/emacs/site-lisp/slime/start-swank.lisp &'
let g:slimv_disable_scheme = 1

" Gundo
nnoremap <Leader>u :GundoToggle<CR>

" YouCompleteMe
":h 'complete'
set complete=.,i,b,u,]

" screen
vnoremap <Leader>e :ScreenSend<CR>
nnoremap <Leader>e V:ScreenSend<CR>
" }}}

""""""""""""""""""""""""""""""
" generic Leader bindings
""""""""""""""""""""""""""""""
" {{{
nnoremap <Leader>t :!ctags -R .<CR>
nnoremap <Leader>b :b#<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :bp<CR>
nnoremap <Leader>m :bn<CR>
nnoremap <silent> <Leader>v :e ~/.vimrc<CR>
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

vnoremap <Leader>s <Esc>`.``gvP``P
" }}}

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""
" {{{
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set t_Co=256

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set list listchars=tab:»\ ,trail:·
set autoread
set visualbell
set number
set nowrap
set showcmd
"set cursorline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set cindent
" }}}

""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""
" {{{
augroup indentation
    autocmd!
    autocmd FileType ocaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_py
    autocmd!
    autocmd FileType python inoreabbrev _S __self__
augroup END

augroup filetype_asm
    autocmd!
    autocmd FileType asm setlocal noexpandtab nocindent
augroup END

augroup filetype_go
    autocmd!
    autocmd Filetype go setlocal noexpandtab
augroup END
" }}}
