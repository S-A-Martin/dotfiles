"RESET VIM BEFORE CONFIGURING
runtime defaults.vim

" THEME/VISUALS
syntax on
colorscheme retrobox
set background=dark
highlight Normal ctermbg=black
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set number relativenumber
set ruler
set nowrap
set showmatch

set hlsearch
set incsearch
set ignorecase
set smartcase
set history=1000
set spell

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

