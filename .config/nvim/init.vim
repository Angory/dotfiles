""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                preamble                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set t_Co=256
set guicursor=
call plug#begin('~/.vim/plugged')

" Status line
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }

" Git integration
Plug 'tpope/vim-fugitive'

" File Browser
Plug 'scrooloose/nerdtree'

" Brackets
Plug 'Raimondi/delimitMate'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Doxygen
"Plug 'vim-scripts/DoxygenToolkit.vim'

" Syntax highliting
Plug 'sheerun/vim-polyglot'

" SpellChecking
Plug 'rhysd/vim-grammarous'

" Linting
Plug 'neomake/neomake'
" {{{
    let g:neomake_open_list = 2
    " neomake is async => it doesn't block the editor
    " It's a syntastic alternative. Syntastic was slow for me on python files.
    " $ sudo pip2/pip3 install flake8 -U
    " $ sudo pip2/pip3 install vulture -U
    let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture', "python"]
    " let g:neomake_python_enabled_makers = ['flake8', 'pep8']
    " E501 is line length of 80 characters
    let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
    let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=120', '--ignore=E115,E266'], }
 
    " run neomake on the current file on every write:
    autocmd! BufWritePost * Neomake
" }}}

" Formatting
Plug 'sbdchd/neoformat'

" Ultinsips and YouCompleteMe play nice with this
Plug 'ervandew/supertab'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Auto Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" latex
Plug 'lervag/vimtex'

" fuzzy search
Plug 'kien/ctrlp.vim'

"use patched unicode symbols from nerd fonts, needs to load last!
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" Setup Python
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File and Buffer Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Use all new vim functionalities
set hidden                      " Do not close the buffers, hide them
set history=1000                " Remember more commands and search history
set undolevels=1000             " Remember more levels of undo
set noerrorbells                " No buzz on error
set novisualbell                " No 'visual buzz' on error
set autoread                    " Reload the file if changed from the outside
set switchbuf=useopen           " if opening a file from :ls, :buffers, :files, etc. jump to open version
                               "" of the file, if one exists
set confirm                     " dialog foor unsaved changes
set splitright                  " got to right pane by default (Needed for quickmenu)

" Terminal/GUI setup
set encoding=utf-8                " Fix encoding shit...
set mouse=a                       " Use mouse when using vim (tip: maj during
                                  "" selection to use ctrl-maj-c to copy
                                  "" text)
" smooth redraw
set lazyredraw

" Show keys in status
set showcmd

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Indentation
"""""""""""""""""""""""""""""""""""""""
" Global configuration
set expandtab                     " Transform kitten killer tabs to spaces
set tabstop=4                     " Number of visual spaces per tab
set shiftwidth=4                  " Number of spaces to use for autoindent
set backspace=indent,eol,start    " Allow backspacing over everything in
set textwidth=120
"" insert mode
set softtabstop=0

set autoindent                    " Always set autoindent on
set copyindent                    " Copy the previous indentation on autoindent
set shiftround                    " Use n shiftwidth when indenting with <>
set smarttab                      " Use smart removal when using tabs
autocmd FileType c,cpp  set smartindent " For c file, automatically inserts
                                        "" one extra level of indentation in some cases
set nojoinspaces                  " When joining lines that end with '.', '?' or '!', ' '
                                  "" only insert one space, not two

highlight OverLength ctermbg=black ctermfg=white guibg=#FFD9D9

" Trailing / tabs
set showbreak=↪\ 
set list
set listchars=tab:→\
set listchars+=nbsp:␣
set listchars+=trail:·
set listchars+=extends:⟩
set listchars+=precedes:⟨
" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set shortmess=a                 " Deal with messages
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position
set ignorecase
set smartcase

" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one

" Cursor
"""""""""""""""""""""""""""""""""""""""
" Show cursorline only for active window
augroup cline
   "au!
   "au WinLeave,InsertEnter * set nocursorline
   "au WinEnter,InsertLeave * set cursorline
augroup END

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"*****************************************************************************
"" Visual Settings
"*****************************************************************************
colorscheme apprentice
set background=dark

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

set tw=120
set fo+=t

""*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
noreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Mappings
"*****************************************************************************
" our <leader> will be the space key
let mapleader=" "

" our <localleader> will be the '-' key
let maplocalleader="-"

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Fast save file
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>wq :wq<cr>
"" Close buffer
noremap <leader>c :bd<CR>

" move among buffers with double leader
map <leader><leader> :bnext<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Escape
inoremap jj <Esc>

"" RELOAD VIMRC
noremap <leader>erc :e! $MYVIMRC<CR>
noremap <silent> <leader>src :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Also center the screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" This makes j and k work on "screen lines" instead of on "file lines"; now, when
" we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk

" Switch to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" z= get suggestions
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gvnoremap <leader>su z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 ctrlp                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30'

" Faster indexing of files; requires having ag (AKA the_silver_searcher)
" installed.
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
     \ --ignore .git
     \ --ignore .svn
     \ --ignore .hg
     \ --ignore .DS_Store
     \ --ignore "**/*.pyc"
     \ --ignore BoostParts
     \ -g ""'


"" Vim Airline
let g:airline_theme = "apprentice"
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '¶'
let g:airline_symbols.whitespace = 'Ξ'
set fillchars+=stl:\ ,stlnc:\

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <leader>nf :NERDTreeFind<CR>
noremap <leader>nn :NERDTreeToggle<CR>

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_python_binary_path = 'python'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

