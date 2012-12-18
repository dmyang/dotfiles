" Forget vi compatibility
set nocompatible

" Load Pathogen
runtime bundle/plugin-pathogen/autoload/pathogen.vim
filetype off
let g:pathogen_disabled = ['pathogen', 'plugin-nerdtree', 'plugin-minibufexpl']
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Open NERDTree when vim starts if no file is specified
" autocmd vimenter * if !argc() | NERDTree | endif

" Open NERDTree on right
"let g:NERDTreeWinPos = "right"

" Change leader key
let mapleader = ","

" General
set fillchars=""	" Remove characters in window splits
set ls=2		" Status bar with file path and name
"set number		" Enable line numbers
set ruler		" Show line and column number
set scrolloff=3		" 3 lines of context
set showmode		" Persistently show the mode
set wildmenu		" dmenu style menu of commands
set cursorline
set mouse=a
set ttymouse=xterm

" Allow backspace to remove these characters
set backspace=indent,eol,start

" Show hidden characters
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" Window specific
set winheight=30
set winminheight=5
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Searching
set hlsearch
set incsearch
set ignorecase
set sm

" Wrapping
set textwidth=80
set nowrap

" Tab settings
set tabstop=4
set shiftwidth=2
set softtabstop=4
set expandtab

" Disable bells
set novisualbell

" File based
au! BufRead,BufNewFile *.json set filetype=json
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/lang-yaml/colors/yaml.vim

filetype indent on
filetype plugin on
syntax on

" Color
set background=dark
colorscheme Tomorrow-Night

" Disable arrow keys (force good habits)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Ack Settings
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Omni Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
inoremap <C-space> <C-x><C-o>

" Map panes
map <leader>n :NERDTreeToggle<CR>
map <leader>m :TagbarToggle<CR>
map <Leader>b :MiniBufExplorer<cr>

" Syntastic config
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" <Ctrl-l> redraws the screen and removes any search highlighting.
"nnoremap <silent> <C-l> :nohl<CR><C-l>

" Color column 80
set cc=80

" minibufexpl options
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
