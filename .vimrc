set nocompatible " no compatibility with legacy vi
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
let g:ruby_indent_access_modifier_style = 'outdent'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'AndrewRadev/switch.vim'

set shell=/bin/zsh " maybe /bin/sh?
syntax enable
set encoding=utf-8
set number " show line numbers
set showcmd " display incomplete commands
set showmatch " show matching bracers
set mouse=a " use mouse in all modes

set clipboard=unnamed " yank to clipboard

set splitbelow " new split right below
set splitright
set lazyredraw " only redraw new splits

" Whitespace
set tabstop=2 shiftwidth=2
set softtabstop=2
set expandtab " convert tabs to spaces
set backspace=indent,eol,start " use backspace properly
set ruler " show cursor pos
set autoindent
set nofoldenable " no code folding
set antialias
set linespace=0 " configure line height

" Searching
set hlsearch
set incsearch
" set ignorecase
" set smartcase

" Tmp and backup folders
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " enable vi to close when NERDTree is the only open tab

" ====================
" CtrlP options
" :help ctrlp-commands
" ====================
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

nmap <LEADER>rf :CtrlPClearCache<CR>

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|^vendor$|log|^coverage$|^tmp$|^rdoc$|',
  \ 'file': '\.(png|jpg|gif|DS_Store|exe|so|dll)$'
  \ }
let g:ctrlp_max_depth = 10      " Directory depth to recurse into when scanning
let g:ctrlp_open_new_file = 't' " open files in new tab

" Use ag in CtrlP for listing files. fast enough not to use caching
" brew install silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let mapleader = ","

" Keymaps
nnoremap <LEADER>f :grep!<SPACE>
nnoremap <LEADER>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <C-n> :NERDTreeToggle<CR>
noremap <space><space> :w<CR>
nnoremap - :Switch<cr>
" split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" disable Ex mode
noremap Q <NOP>
" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

