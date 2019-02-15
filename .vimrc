set nocompatible              " break away from old vi compatibility
set nofoldenable              " disable folding

let g:powerline_pycmd="py3"

let powerlinecmd=substitute(system("which powerline"), '\n\+$', '', '')
if !empty(glob(powerlinecmd))
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

filetype on                   " enable filetype detection
filetype plugin on            " filetype specific detection

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Install plugins with       " :PlugInstall "
" Update plugins with        " :PlugUpdate  "
" Update vim-plug with       " :PlugUpgrade "
" Delete unused plugins with " :PlugClean   "
" Check plugin status with   " :PlugStatus  "
call plug#begin('~/.vim/plugged')
" Generic plugins:
Plug 'ssh://github/MattesGroeger/vim-bookmarks'       " Manage bookmarks
Plug 'ssh://github/Shougo/unite.vim'                  " Needed by vimfiler and others
Plug 'ssh://github/Shougo/vimproc.vim'                " Speed up unite.vim and others
Plug 'ssh://github/Shougo/vimfiler.vim'               " Better than NERDTree
" Plug 'ssh://github/ervandew/supertab'                 " Neocomplete is better but requires vim with lua
Plug 'ssh://github/vim-scripts/tComment'              " Comment/uncomment text blocks
Plug 'ssh://github/scrooloose/syntastic'              " Generic syntax checker for errors
Plug 'ssh://github/Keithbsmiley/investigate.vim'      " Search documentation for word under cursor
Plug 'ssh://github/vim-scripts/Tagbar'                " A class outline viewer
Plug 'ssh://github/tpope/vim-dispatch'                " Dispatch commands asynchronously
Plug 'ssh://github/ConradIrwin/vim-bracketed-paste'   " Transparent pasting to vim
Plug 'ssh://github/godlygeek/tabular'                 " Align text by pattern
" Tmux usage helpers:
Plug 'ssh://github/christoomey/vim-tmux-navigator'    " Navigate easily between vim and tmux panes
" Git usage helpers:
Plug 'ssh://github/tpope/vim-fugitive'                " Generic wrapper for git
Plug 'ssh://github/airblade/vim-gitgutter'            " Show uncommitted modifications
Plug 'ssh://github/gregsexton/gitv'                   " A generic git repository viewer/frontend
" Display related plugins:
Plug 'ssh://github/godlygeek/csapprox'                " Make highcolor gvim schemes 256 color vim compatible
Plug 'ssh://github/xolox/vim-misc'                    " Needed by vim-colorscheme-switcher
" Plug 'ssh://github/xolox/vim-colorscheme-switcher'  " A colorscheme changer
Plug 'ssh://github/jnurmine/Zenburn'
Plug 'ssh://github/nanotech/jellybeans.vim'
Plug 'ssh://github/junegunn/seoul256.vim'
Plug 'ssh://github/gosukiwi/vim-atom-dark'
Plug 'ssh://github/cseelus/vim-colors-clearance'
Plug 'ssh://github/guns/jellyx.vim'
Plug 'ssh://github/trapd00r/neverland-vim-theme'
Plug 'ssh://github/Lokaltog/vim-distinguished'
" Filetype related plugins:
Plug 'ssh://github/rodjek/vim-puppet'                 " Puppet specific editing support
Plug 'ssh://github/jamessan/vim-gnupg'                " Transparently edit gpg encrypted files
Plug 'ssh://github/tpope/vim-markdown'                " Support for markdown format (.markdown)
Plug 'ssh://github/tpope/vim-endwise'                 " Automatically end some structures
Plug 'ssh://github/vim-scripts/Vimchant'              " Spell checking for Finnish
Plug 'ssh://github/vim-scripts/Vim-R-plugin'          " Support for R
Plug 'ssh://github/leafgarland/typescript-vim'        " Support for Typescript
" Plug 'ssh://github/vim-scripts/IndentConsistencyCop'  " Fix for indent inconsistencies
Plug 'ssh://github/tpope/vim-sleuth'                  " Fix for indent inconsistencies (automatic)
" UltiSnips:
Plug 'ssh://github/SirVer/ultisnips'                  " UltiSnips engine
Plug 'ssh://github/honza/vim-snippets'                " UltiSnips snippets
Plug 'ssh://github/rbonvall/snipmate-snippets-bib'    " UltiSnips snippet for bib
call plug#end()

" Plugin UltiSnips specific settings -- begin
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Plugin UltiSnips specific settings -- end

" Plugin Syntastic specific settings -- begin
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_puppet_puppetlint_args = "--no-documentation-check"
let g:syntastic_cpp_checkers=['']                   " Syntastic doesn't work with meson and include dirs
" Plugin Syntastic specific settings -- end

" Plugin Unite specific settings -- begin
nnoremap <C-p> :Unite file_rec/async<CR>            " CtrlP type of file searching
nnoremap <SPACE>/ :Unite grep:.<CR>                 " Ack/ag type of content searching
let g:unite_source_history_yank_enable = 1          " Yankring/yankstack type of yanks
nnoremap <SPACE>y :Unite history/yank<CR>           " Yankring/yankstack type of yanks
nnoremap <SPACE>s :Unite -quick-match buffer<CR>    " LustyJugger type of buffer switching
" Plugin Unite specific settings -- end

" Plugin SuperTab specific settings -- begin
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
" Plugin SuperTab specific settings -- end

" Plugin GitGutter specific settings -- begin
hi SignColumn ctermbg = none
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1
" Plugin GitGutter specific settings -- end

" UltiSnips specific settings -- begin
let g:UltiSnipsUsePythonVersion = 3
" UltiSnips specific settings --end

" VimFiler specific settings -- begin
let g:vimfiler_as_default_explorer = 1              " Use ':e.' command to activate
" VimFiler specific settings -- end

" Generic keymappings for plugins -- begin
nnoremap <F10> :TagbarToggle<CR>                    " Plugin tagbar
nnoremap <F9> :Dispatch<CR>                         " Plugin dispatch
nnoremap <F8> :Gitv<CR>                             " Plugin gitv
" Generic keymappings for plugins -- end

nnoremap <silent> <CR> :noh<CR><CR>                 " unset 'last search pattern'
set pastetoggle=<F2>                                " toggle paste/nopaste mode with F2 key

set nobackup                  " no backup files to extend SSD life
set nowritebackup             " no write backup files to extend SSD life
set noswapfile                " disable swap files to save extend life

set ttymouse=xterm2           " Select tty mode supporting a mouse
set mouse=r                   " Mouse support for all modes
" Note: mouse=a will trigger visual mode when using mouse. This will break
" usage in tmux so that text is not inserted to system clipboard.
" When needing to copy text to system clipboard, use ':set mouse=r' instead
" temporarily or change this option.

syntax on                     " define syntax highlighting before gui settings
set t_ut=                     " disable background color erase (bce)

if has('gui_running')
    set guifont=Monospace\ 12 " use ':set guifont' to see the name
else
    " Note: Do not set t_Co here, instead check its value with :set t_Co?
    let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
    "let g:CSApprox_loaded = 0
endif

set background=dark           " set dark background

set cursorline                " Enable current line highlighting

" Zenburn -- begin
" let g:zenburn_high_Contrast = 1
" Zenburn -- end

" Seoul256 -- begin
" let g:seoul256_background = 100
" Seoul256 -- end

" Select current colorscheme
colorscheme atom-dark-256
" colorscheme seoul256
" colorscheme industry
" colorscheme desert
" colorscheme ron
" colorscheme koehler

set list                      " show invisible characters
set listchars=                " set specific listchars
set listchars+=nbsp:⇶         " setting for non-breaking space
set listchars+=tab:>-         " setting for tabulator
set listchars+=extends:▶      " setting for last character in a line
set listchars+=precedes:◀     " setting for first character in a line
set listchars+=trail:▂        " setting for trailing characters

set fillchars=
set fillchars+=vert:│         " Better looking character for vertical splits
set fillchars+=diff:─         " Better looking character for diffs
set fillchars+=fold:─         " Better looking character for folds

set ttyfast                   " we have a fast terminal
set lazyredraw                " don't redraw when don't have to
set noerrorbells              " No error bells please

set wrap                      " soft wrap long lines
set linebreak                 " never break words when out of window
let &showbreak = '↳ '         " show marker for soft wrapped lines

set hidden                    " http://usevim.com/2012/10/19/vim101-set-hidden/
set autoread                  " watch for file changes
set noautowrite               " don't automagically write on :next

set showmode                  " show current mode
set showcmd                   " show (partial) command in status line
set cmdheight=2               " explicitly set the height of the command line
set ruler                     " show current position at bottom
set more                      " use more prompt

set backspace=indent,eol,start
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set whichwrap+=<,>,h,l,[,]

" Indents and tabs
set autoindent                " set the cursor at same indent as line above
set smartindent               " try to be smart about indenting (C-style)
set expandtab                 " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4              " spaces for each step of (auto)indent
set softtabstop=4             " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                 " for proper display of files with tabs
set shiftround                " always round indents to multiple of shiftwidth
set copyindent                " use existing indents for new indents
set preserveindent            " save as much indent structure as possible
filetype plugin indent on     " load filetype plugins and indent settings
" Note: Use ":retab" to change tabs to spaces

" remove trailing with space when saving a file:
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

autocmd FileType c setlocal foldmethod=syntax    " enable folding for C
autocmd FileType cpp setlocal foldmethod=syntax  " enable folding for C++
autocmd FileType make setlocal noexpandtab       " no expandtab for makefiles
" Note: Use ":set filetype?" to see the filetype

set nojoinspaces              " no extra spaces after '.' when joining lines

set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right

set history=200
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set shell=bash
set fileformats=unix
set ff=unix

set wildmenu                  " turn on wild menu :e <Tab>
set wildmode=list:longest     " set wildmenu to list choice
let maplocalleader=','        " all my macros start with ,
set laststatus=2

" searching
set gdefault                  " set global as default
set incsearch                 " incremental search
set ignorecase                " set case sensitivity
set smartcase                 " unless there's a capital letter
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" backup
set backup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp
set viminfo=%100,'100,/100,h,\"500,:100,n$HOME/.viminfo

" Settings for Artistic Style (astyle), use "gggqG" to format file
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ --style=java\ --indent-switches\ --indent-cases\ --indent-namespaces\ --indent-preproc-define\ --indent-col1-comments\ --pad-oper\ --pad-header\ --delete-empty-lines\ --fill-empty-lines\ --align-pointer=type\ --align-reference=type\ --break-elseifs\ --add-brackets\ --convert-tabs\ --max-code-length=80\ --break-after-logical

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" mappings
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

" Set xterm keys on for the ctrl+left/right word skipping to work
if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif

