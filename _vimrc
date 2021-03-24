" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set guifont=Courier_New:h10
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set undodir=~/vim_backup/undodir
set undofile

set smartindent

set shell=C:/Users/edmisml/AppData/Local/Programs/Git/bin/bash.exe
:tnoremap <Esc> <C-\><C-n>

call plug#begin('vimfiles/plugged')
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:netrw_banner=0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>cp :CtrlP<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>pt :NERDTreeToggle<bar> :vertical resize 30<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR> 


