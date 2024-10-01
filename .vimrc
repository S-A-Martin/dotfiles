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
set path+=** " allow recursive searching from the cwd
set path+=/c/msys64/ucrt64/include/**3
set wildmenu " enable the wild menu for tab completion
set wildoptions=pum,fuzzy,tagfile
set wildmode=longest:full,full

" Remap hjkl keys in command-line mode for wildmenu navigation
cnoremap <expr> <C-j> wildmenumode() ? "\<C-n>" : "\<C-j>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-p>" : "\<C-k>"
cnoremap <expr> <C-h> wildmenumode() ? "\<Left>" : "\<C-h>"
cnoremap <expr> <C-l> wildmenumode() ? "\<Right>" : "\<C-l>"


" disable arrow keys
noremap <Left>  <nop>
noremap <Down>  <nop>
noremap <Up> 	<nop>
noremap <Right> <nop>
inoremap <Left>  <nop>
inoremap <Down>  <nop>
inoremap <Up> 	 <nop>
inoremap <Right> <nop>

"function! RG(args) abort
"    let l:tempname = tempname()
"    let l:pattern = '.'
"    if len(a:args) > 0
"        let l:pattern = a:args
"    endif
"    " rg --vimgrep <pattern> | fzf -m > file
"    execute 'silent !rg --vimgrep ''' . l:pattern . ''' | fzf -m > ' . fnameescape(l:tempname)
"    try
"        execute 'cfile ' . l:tempname
"        redraw!
"    finally
"        call delete(l:tempname)
"    endtry
"endfunction
"
"" :Rg [pattern]
"command! -nargs=* Rg call RG(<q-args>)
"
"" \fs
"nnoremap <leader>fs :Rg<cr>
