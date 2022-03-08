"""""""""""""""""""""""""""""""""""""""""""
" ~/.vimrc
"""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'git@github.com:VundleVim/Vundle.vim.git'
Plugin 'git@github.com:fugalh/desert.vim.git'
Plugin 'git@github.com:fholgado/minibufexpl.vim.git'
Plugin 'git@github.com:vim-scripts/a.vim.git'
Plugin 'git@github.com:chr4/nginx.vim.git'
Plugin 'git@github.com:yegappan/taglist.git'
Plugin 'git@github.com:preservim/tagbar.git'
Plugin 'git@github.com:preservim/nerdtree.git'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Sytax highlighting
syntax on

" Filetype detecting
filetype plugin indent on

" File encoding
set fileencodings=utf-8,ucs-bom,chinese,taiwan,latin1,gbk
let &termencoding=&encoding

" File formats
set fileformats=unix,dos,mac

" Indenting
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
let g:indent_guides_guide_size=1

" Editing
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoread
set iskeyword+=_,$,@,%,#,-

" Displaying
set number
set nowrap
set linespace=0
set textwidth=0
set nolinebreak
set hidden
set scrolloff=7
set scrolljump=3
set showmatch
set matchtime=2
set matchpairs=(:),[:],{:},<:>
set lazyredraw

" Disable bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set report=0

" Command line
set showcmd
set history=500
set wildmenu
set wildmode=list,longest,full
set wildignore=*~,*.o,*.so,*.so.*,*.a,*.d,*.pyc,*.pyo,*.class
set shortmess+=filmnrxoOtT

" Making View
"set viewoptions=folds,options,cursor,unix,slash
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

" Save editing position
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exec "normal g'\"" |
        \ endif
endif

" Status line
set ruler
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2

" Searching/Replacing
set magic
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault
set wrapscan

" Folding
set foldenable
set foldmethod=indent
set foldlevel=100

" Backing up
set backup
set writebackup
set backupdir=~/.tmp,/tmp
if !isdirectory($HOME.'/.tmp')
    if exists('*mkdir')
        call mkdir($HOME.'/.tmp', '', 0755)
    else
        call system('mkdir '.$HOME.'/.tmp')
    endif
endif

" Swapping
set noswapfile

" Disable mouse
set mouse=

" Highlighting the current line
if exists('+cursorline')
    set cursorline
endif

" Coloring
colorscheme desert
hi ColorColumn ctermbg=darkgray guibg=darkgray

" GUI settings
if has('gui_running')
    if has('win32') || has('win64')
        set guifont=Courier_New:h9:cANSI
    else
        set guifont=Luxi\ Mono\ 9
    endif
    set guioptions-=m
    set guioptions-=T
    set t_Co=256
endif

" Search paths
if has('unix')
    set path=.,/usr/local/include,/usr/include
    set path+=/usr/include/c++/**
    set path+=./include,../include
endif

" Mapping - mapleader
let mapleader=','
let g:mapleader=','

" Mapping - quit/save
nmap <leader>q :qa!<cr>
nmap <leader>wq :wqa!<cr>
nmap <leader>ww :w!<cr>
nmap <leader>wa :wa!<cr>
nmap <leader>w! :w !sudo tee % >/dev/null<cr><cr>

" Mapping - buffer switching
nmap <c-n> :bn<cr>
nmap <c-p> :bp<cr>

" Mapping - pasting mode toggle
nmap <leader>p :setlocal paste!<cr>

" Mapping - avoiding typo
nnoremap ; :

" Mapping - folding
nmap <leader>f0 :set foldlevel=0<cr>
nmap <leader>f1 :set foldlevel=1<cr>
nmap <leader>f2 :set foldlevel=2<cr>
nmap <leader>f3 :set foldlevel=3<cr>
nmap <leader>f4 :set foldlevel=4<cr>
nmap <leader>f5 :set foldlevel=5<cr>
nmap <leader>f6 :set foldlevel=6<cr>
nmap <leader>f7 :set foldlevel=7<cr>
nmap <leader>f8 :set foldlevel=8<cr>
nmap <leader>f9 :set foldlevel=9<cr>

" Mapping - clear highlighted search
nmap <silent> <leader>/ :nohls<cr>

" Mapping - visual shifting (does not exit visual mode)
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

if has("win32") || has ('win64')
    let g:vimPath = $HOME."/vimfiles/"
else
    let g:vimPath = $HOME."/.vim/"
endif

" File-skeleton
let g:skeletonAuthor = 'acelyc111'
let g:skeletonEmail = '405403881@qq.com'

function! ReplaceSkeletonFields()
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#<DATE>#\1' .  strftime('%F') . '#e'
    keepjumps exe '1,' . n . 's#<DATETIME>#\1' .  strftime('%F %T') . '#e'
    keepjumps exe '1,' . n . 's#<FILENAME>#' .  expand('%:t') . '#e'
    keepjumps exe '1,' . n . 's#<E-MAIL>#\1' .  g:skeletonEmail . '#e'
    keepjumps exe '1,' . n . 's#<AUTHOR>#\1' . g:skeletonAuthor . '#e'
    " call histdel('search', -1)
    exec "normal G"
endfun

function! InsertSkeleton()
    let skeletonFile = g:vimPath ."/skeletons/". &ft
    if (filereadable(skeletonFile))
      exec ":0r ".skeletonFile | call ReplaceSkeletonFields()
    endif
endfun

au BufNewFile * :silent! call InsertSkeleton()

" Plugin - minibufexpl
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplTabWrap=1

" Plugin - a.vim
nmap <leader>a :A<cr>
let g:alternateNoDefaultAlternate=1
let g:alternateExtensions_h="c,cpp,cxx,cc,CC,inl,m"
let g:alternateExtensions_hh="cc,cpp,cxx,CC,inl,m"
let g:alternateExtensions_H="C,CPP,CXX,CC,INL"
let g:alternateExtensions_inl="h,hh,hpp"
let g:alternateExtensions_cc="h,hh,hpp"
let g:alternateExtensions_INL="H,HH,HPP"
let g:alternateExtensions_m="h"

" Plugin - TagBar
nmap <leader>t :TagbarToggle<cr>

" Plugin - NERDTree
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <silent> <F1> :NERDTree<cr>

" Other filetypes
augroup filetype
    au! BufRead,BufNewFile *.thrift set filetype=thrift
    au! BufRead,BufNewFile *.proto set filetype=proto
    au! BufRead,BufNewFile *.ipp set filetype=cpp
    au! BufRead,BufNewFile *.py set filetype=python
augroup end
