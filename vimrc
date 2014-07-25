set nocompatible                " choose no compatibility with legacy vi

" autocmd BufWritePost *.coffee silent make!

" map <leader>r :NERDTreeFind<cr>

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set foldlevelstart=20

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'chriskempson/base16-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'surround.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'

Bundle 'benmills/vimux'
Bundle 'terryma/vim-multiple-cursors'

Bundle 'mattn/emmet-vim'
Bundle 'majutsushi/tagbar'

Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'

"" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

Bundle "walm/jshint.vim"

" Optional:
Bundle "honza/vim-snippets"

Bundle "ack.vim"

"" Gist
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" lang
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'bling/vim-bufferline'
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
" My bundles here:
"
" original repos on GitHub
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" " non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" " Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" " ...

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

set gfn=Menlo:h12
"set gfn=Inconsolata:h14
"


syntax on
set background=dark
set encoding=utf-8
set showcmd                     " display incomplete commands

filetype plugin indent on

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hidden
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" indent
set autoindent
set cindent
set smartindent

set number
set nobackup
set noswapfile
set nowritebackup

set laststatus=2

" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-default
colorscheme Tomorrow-Night
"
" override Tomorrow - doesn't work
" 
" if !has("gui_running")
" 	let s:background = "303030"
"   let s:background = "1d1f21"
" end


" airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:bufferline_echo=0


" NERDTree
let NERDTreeShowBookmarks=1

" NERDCommenter
let NERDSpaceDelims=1

" Coffeescript
" autocmd BufWritePost *.coffee silent make!
" let coffee_make_options = '--bare'

" CtrlP
let g:ctrlp_map = '<Nul>'
let g:ctrlp_follow_symlinks = 1

"macvim
" macmenu &File.New\ Tab key=<D-S-t>

"
" keymap
"
let mapleader=","
nmap <silent> j gj
nmap <silent> k gk

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

map <silent> <leader>e :NERDTreeToggle<CR>
map <silent> <leader>E :NERDTreeClose<CR>
map ; :CtrlPBuffer<CR>
nnoremap <silent> <leader>t :CtrlP<CR>
nnoremap <silent> <leader>r :CtrlPMRU<CR>
set pastetoggle=<F2>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

nmap <C-#> :b#<CR>
nmap <F8> :TagbarToggle<CR>

map <leader>bc :bufdo bdelete<CR>
nnoremap <C-e> :e#<CR>



" nmap <ctrl>-p
"
" colors
hi clear SpellBad
" hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red
hi SpellBad cterm=underline,bold
