set nocompatible " no compatibility with legacy vi
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-dispatch'
Bundle 'nanotech/jellybeans.vim'

set shell=/bin/zsh
syntax enable

" ====================
" Jellybeans color scheme
" ====================
set t_Co=256 " 256 color mode
let g:jellybeans_background_color_256=0 " black is black
colorscheme jellybeans
set colorcolumn=80,105,115
highlight ColorColumn  ctermbg=233

" ====================
" General
" ====================
set encoding=utf-8
set number " show line numbers
set showcmd " display incomplete commands
set showmatch " show matching bracers
set mouse=a " use mouse in all modes

" ====================
" Tmux
" ====================
Bundle 'christoomey/vim-tmux-navigator'
if $TMUX == ''
  set clipboard+=unnamed
endif

" ====================
" Splits
" ====================
set splitbelow " new split right below
set splitright
set lazyredraw " only redraw new splits

" ====================
" Whitespace
" ====================
set tabstop=2 shiftwidth=2
set softtabstop=2
set expandtab " convert tabs to spaces
set backspace=indent,eol,start " use backspace properly
set ruler " show cursor pos
set autoindent
set nofoldenable " no code folding
set antialias
set linespace=0 " configure line height

" ====================
" Searching
" ====================
set hlsearch
set incsearch
" set ignorecase
" set smartcase

" ====================
" Tmp and backup folders
" ====================
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

" ====================
" Nerdtree
" ====================
Bundle 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " enable vi to close when NERDTree is the only open tab
let g:ruby_indent_access_modifier_style = 'outdent'

" ====================
" CtrlP
" ====================
Bundle 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
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

" ====================
" Ruby & Rails
" ====================
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" ====================
" Rspec
" ====================
Bundle 'thoughtbot/vim-rspec'
let g:rspec_command = "Dispatch ./bin/rspec {spec}"

" ====================
" Git integration
" ====================
Bundle 'tpope/vim-fugitive'

" ====================
" TComment
" ====================
Bundle 'tomtom/tcomment_vim'

" ====================
" Switch
" ====================
Bundle 'AndrewRadev/switch.vim'

" ====================
" Keymaps
" ====================
let mapleader = ","

" General
noremap <space><space> :w<CR>
nnoremap <LEADER>bi :source ~/dotfiles/.vimrc<CR>:BundleInstall<CR>
nnoremap <LEADER>vi :e ~/dotfiles/.vimrc<CR>
" Searching
nnoremap <LEADER>f :grep!<SPACE>
nnoremap <LEADER>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
map <Leader>h :noh<CR>
" Git
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
" vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
" NERDTree
map <C-n> :NERDTreeToggle<CR>
" TComment
map <Leader>/ :TComment<CR>
" Switch
nnoremap - :Switch<cr>
" RSpec
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>sn :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>
" Split
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Disable Ex mode
noremap Q <NOP>
" Ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" CtrlP
nmap <LEADER>rf :CtrlPClearCache<CR>
