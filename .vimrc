set nocompatible " no compatibility with legacy vi
let mapleader = ","

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'AndrewRadev/switch.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'bling/vim-airline'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'elixir-lang/vim-elixir'
Bundle 'jgdavey/vim-blockle'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'pry'
Bundle 'scrooloose/nerdtree'

Bundle 'scrooloose/syntastic'
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='☹'
let g:syntastic_style_error_symbol='⚠'
let g:syntastic_ruby_checkers = ['mri'] ", 'rubocop']

Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
call vundle#end()
filetype plugin indent on

set shell=/bin/zsh
syntax enable
set shortmess+=I

" ====================
" Color scheme
" ====================
set t_Co=256 " 256 color mode
let g:solarized_termcolors=256
set colorcolumn=105
highlight ColorColumn  ctermbg=233
set background=light
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized
let g:airline_theme = "solarized"

" ====================
" General
" ====================
set encoding=utf-8
set number " show line numbers
set showcmd " display incomplete commands
set showmatch " show matching bracers
set mouse=a " use mouse in all modes
set cursorline " whereami!?
set laststatus=2
runtime macros/matchit.vim
set clipboard=unnamed

" ====================
" Cursor
" ====================
" change cursor when in insert mode (also works in tmux)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ====================
" Fast switching modes yo
" ====================
" make switching modes fast again
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
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
autocmd BufWritePre * :FixWhitespace
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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " enable vi to close when NERDTree is the only open tab
map <leader>nf :NERDTreeFind<cr>
let NERDTreeShowHidden=1

" ====================
" CtrlP
" ====================
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
let g:blockle_mapping = '<Leader>bb'

" ====================
" Rspec
" ====================
let g:rspec_command = "Dispatch ./bin/rspec {spec}"
let g:rspec_runner = "os_x_iterm"

" ====================
" Git integration
" ====================

" ====================
" TComment
" ====================

" ====================
" Switch
" ====================

" General
noremap <space><space> :w<CR>
nnoremap <Leader>bi :source ~/dotfiles/.vimrc<CR>:BundleInstall<CR>
nnoremap <Leader>vi :e ~/dotfiles/.vimrc<CR>
" Searching
nnoremap <Leader>f :grep!<SPACE>
nnoremap <Leader>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
map <Leader>h :noh<CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
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
" Format JSON
map <Leader>fj <Esc>:%!python -m json.tool<CR>
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
nmap <Leader>rf :CtrlPClearCache<CR>
