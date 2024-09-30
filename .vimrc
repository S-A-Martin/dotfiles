runtime macros/matchit.vim  " enable vim's built in bracket matching plugin
filetype plugin indent on   " enable filetype dependent plugins and indentation
syntax on   " syntax highlighting
colorscheme retrobox   " vim theme
set background=dark   " use the theme's dark mode
highlight Normal ctermbg=black   " make the windows background black
set autoindent   " enable auto-indentation
set tabstop=2 shiftwidth=2 expandtab   " tab width 2 spaces, indentation width 2 spaces, convert tabs to spaces
set number    " enable line numbers
set relativenumber  " enable relative numbers
set ruler " always show current line/char
set nowrap  " do not wrap lines
set showmatch " show matching brackets
set laststatus=2  " always show the status line
set tags=tags;/ " look for tags file in the current directory then upwards
set hlsearch  " highlight search matches
set incsearch " enable incremental searching
set ignorecase  " case insensitive searching
set smartcase     " unless the search contains a capital letter
set history=1000  " keep 1000 commands in history
highlight CursorLineNr ctermfg=214 ctermbg=NONE " colour the current line number
highlight CursorLine cterm=NONE ctermbg=NONE  " no background on the current line number
set cursorline  " show the current line number 
set backspace=indent,eol,start  " allow 'natural' backspacing
let g:netrw_banner = 0  " don't show the NETRW banner
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'  " enable line numbers in NETRW

" disable arrow keys
noremap <Left>  <nop>
noremap <Down>  <nop>
noremap <Up> 	<nop>
noremap <Right> <nop>
inoremap <Left>  <nop>
inoremap <Down>  <nop>
inoremap <Up> 	 <nop>
inoremap <Right> <nop>
