" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Status line
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme = "tomorrow"
    let g:airline#extensions#syntastic#enabled = 1
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

" Theme
Plug 'jlangston/tomorrow-night-vim'

" Git integration
Plug 'tpope/vim-fugitive'

" File Browser
Plug 'scrooloose/nerdtree'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Linting and syntax highliting
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
    let g:syntastic_python_checkers=['python', 'flake8']

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" fuzzy search
Plug 'kien/ctrlp.vim'

" Auto Completion
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"   let g:ycm_seed_identifiers_with_syntax = 1

Plug 'ervandew/supertab'
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" use patched unicode symbols from nerd fonts, needs to load last!
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" Setup Python
"let g:python3_host_prog='C:\toolkit\Anaconda3-64\python.exe'
"let g:python_host_prog='C:\toolkit\Anaconda3-64\envs\py27\python.exe'


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" LEADER
let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Enable hidden buffers
set hidden

"" History
set history=5000

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

set mousemodel=popup

colorscheme Tomorrow-Night

"*****************************************************************************
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
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <leader>nf :NERDTreeFind<CR>
noremap <leader>nn :NERDTreeToggle<CR>


"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
"nnoremap <leader>so :OpenSession<Space>
"nnoremap <leader>ss :SaveSession<Space>
"nnoremap <leader>sd :DeleteSession<CR>
"nnoremap <leader>sc :CloseSession<CR>

"" Tabs
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT
"nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" snippets
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

"" Close buffer
noremap <leader>c :bd<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"autocmd BufWritePre * :%s/\s\+$//e " Remove whitespaces on save

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RELOAD VIMRC
map <leader>s :source $MYVIMRC<CR>

"" Fast save file
nmap <leader>w :w!<cr>
