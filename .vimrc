"RESET VIM BEFORE CONFIGURING
runtime defaults.vim
runtime macros/matchit.vim

filetype plugin indent on

" THEME/VISUALS
syntax on
colorscheme retrobox
set background=dark
highlight Normal ctermbg=black
set autoindent
set tabstop=2 shiftwidth=2 expandtab
set number relativenumber
set ruler
set nowrap
set showmatch
set laststatus=2
set tags=tags;/
set hlsearch
set incsearch
set ignorecase
set smartcase   
set history=1000
set spell
set title
highlight CursorLineNr ctermfg=214 ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE
set cursorline 
set backspace=indent,eol,start

" NETRW SETTINGS
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_browse_split = 0

" KEY MAPPINGS
noremap <Left>  <nop>
noremap <Down>  <nop>
noremap <Up> 	<nop>
noremap <Right> <nop>

inoremap <Left>  <nop>
inoremap <Down>  <nop>
inoremap <Up> 	 <nop>
inoremap <Right> <nop>

