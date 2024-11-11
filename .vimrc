runtime macros/matchit.vim  " enable vim's built in bracket matching plugin
filetype plugin indent on   " enable filetype dependent plugins and indentation
syntax on   " syntax highlighting
colorscheme retrobox   " vim theme
set background=dark   " use the theme's dark mode
highlight Normal ctermbg=black   " make the windows background black
set nocompatible
set autoindent   " enable auto-indentation
set tabstop=2 shiftwidth=2 expandtab   " tab width 2 spaces, indentation width 2 spaces, convert tabs to spaces
set number    " enable line numbers
set relativenumber  " enable relative numbers
set ruler " always show current line/char
set nowrap  " do not wrap lines
set showmatch " show matching brackets
set laststatus=2  " always show the status line
set tags=./tags;,/tags;,~/.vim/system/tags
set notagrelative
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
"set path+=/c/msys64/ucrt64/include/**3
set wildmenu " enable the wild menu for tab completion
set wildoptions=pum,fuzzy,tagfile
set wildmode=longest:full,full
set hidden
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
"inoremap <Left>  <nop>
"inoremap <Down>  <nop>
"inoremap <Up> 	 <nop>
"inoremap <Right> <nop>


if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
  set grepformat^=%f:%l:%c:%m
endif

function! Files()
    " Check if fzf is installed
    if executable('fzf')
        " Get the current working directory in Vim
        let l:cwd = getcwd()
        " Use find to list files and pipe to fzf
        if executable('bat')
          let l:selection = system('find ' . l:cwd . ' -type f | fzf --preview="bat --color=always {}"')
        else
          let l:selection = system('find ' . l:cwd . ' -type f | fzf --preview="cat {}"')
        endif 
        " Check if the selection is not empty
        if v:shell_error == 0 && !empty(l:selection)
            execute 'edit' l:selection
        else
           execute 'redraw!'
        endif
    else
        echo "fzf is not installed. Please install fzf to use this command."
    endif
endfunction

command! Files call Files()


function! EnsureUndoDirExists()
    let undo_dir = expand("~/.vim/undo_dir")
    if !isdirectory(undo_dir)
        call mkdir(undo_dir, "p")
    endif
endfunction

function! EnsureSystemDirExists()
    let system_dir = expand("~/.vim/system_dir")
    if !isdirectory(system_dir)
        call mkdir(system_dir, "p")
    endif
endfunction






set undodir=~/.vim/undo_dir
set undofile

autocmd VimEnter * call EnsureUndoDirExists()
autocmd VimEnter * call EnsureSystemDirExists()
