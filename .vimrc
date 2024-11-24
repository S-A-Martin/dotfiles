" ========================================
" Vim Configuration File
" Author: Steven Martin
" ========================================


" === CORE SETTINGS === 

set nocompatible " use vim settings rather than vi settings
filetype plugin indent on   " enable filetype detection, plugins and indentation
syntax on   " syntax highlighting
runtime macros/matchit.vim  " enable vim's built in bracket matching plugin


" === LEADER KEY CONFIG ===

nnoremap <SPACE> <Nop>| " prevent space being used
let mapleader = " "| " space as leader


" === VISUAL SETTINGS ===

colorscheme retrobox   " set colour scheme
set background=dark   " use dark mode
highlight Normal ctermbg=black   " set black background
highlight CursorLineNr ctermfg=214 ctermbg=NONE " colour the current line number
highlight CursorLine cterm=NONE ctermbg=233 " no background on the current line number
set cursorline  " show the current line number 
set number relativenumber  " enable relative numbers
set ruler " always show current line/char
set nowrap  " do not wrap lines
set laststatus=2  " always show the status line
set splitbelow          " horizontal splits open below
set splitright          " vertical 
set showcmd 

" === SEARCH SETTINGS === 

set hlsearch  " highlight search matches
let @/ = "" " clear search when sourcing vimrc
set incsearch " enable incremental searching
set ignorecase  " case insensitive searching
set smartcase     " unless the search contains a capital letter
nnoremap <Esc> :noh<CR>| " Clear search highlighting 

" === INDENTATION AND TABS ===

set autoindent 
set tabstop=2 " width of tab character
set shiftwidth=2 " width of indent
set expandtab   " use spaces instead of tabs
set smartindent

" === FILE NAVIGATION AND COMPLETION ===

set path+=** " allow recursive searching from the cwd
set wildmenu " enable the wild menu for tab completion
set wildoptions=pum,fuzzy,tagfile
set wildmode=longest:full,full
set wildignore+=*node_modules*,*.ctags,.git/**,tags,cscope*


" === TAGS CONFIGURATION ===

set tags=./tags;,/tags;,~/.vim/system/tags
set notagrelative


" === HISTORY AND UNDO SETTINGS ===

set history=1000  " keep 1000 commands in history
set undodir=~/.vim/undo_dir " set the undo dir
set undofile " use an undo file


" === GENERIC EDITOR SETTINGS ===

set backspace=indent,eol,start  " allow 'natural' backspacing
set autoread " reload files if they are changed externally to vim
set hidden " persist unsaved changes
set nrformats+=alpha " allow incrementing characters as well
set complete+=kspell " enable dictionary completion
set spelllang=en_gb " set spell check lang


" === NETRW SETTINGS ====

let g:netrw_banner = 0  " don't show the NETRW banner
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'  " enable line numbers in NETRW


" === CUSTOM KEY MAPPINGS ===

" Remap hjkl keys in command-line mode for wildmenu navigation
cnoremap <expr> <C-j> wildmenumode() ? "\<C-n>" : "\<C-j>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-p>" : "\<C-k>"
cnoremap <expr> <C-h> wildmenumode() ? "\<Left>" : "\<C-h>"
cnoremap <expr> <C-l> wildmenumode() ? "\<Right>" : "\<C-l>"

" Terminal Mappings 
nnoremap <Leader>t :term<CR>| " open terminal 
nnoremap <Leader>T :terminal ++curwin ++kill=hup<CR>| " open terminal in current window
noremap <Leader>TT :tab terminal ++kill=hup<CR>| " open terminal in new tab
tnoremap <leader>gT <C-\><C-n>gT| "next tab in terminal
tnoremap <leader>gt <C-\><C-n>gt| "previous tab in terminal

" Search and Navigation Mappings
noremap <leader>f :grep<Space>| " grep shortcut
nnoremap <leader>F :Files<CR>| " open fzf filesearch

" Quick Buffer Searching
nnoremap <Leader>b :ls<CR>:buffer<Space>

" Configuration File Editing
nnoremap <Leader>ve :e $MYVIMRC<CR>| " Edit vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>| " Reload vimr configuration file

" Spellcheck Settings
nnoremap <Leader>z :set spell<CR>| " enable spellcheck
nnoremap <Leader>Z :set nospell<CR>| " disable spellcheck

" Disable Arrow Keys In Normal Mode
noremap <Left>  <nop>
noremap <Down>  <nop>
noremap <Up> 	<nop>
noremap <Right> <nop>
"inoremap <Left>  <nop>
"inoremap <Down>  <nop>
"inoremap <Up> 	 <nop>
"inoremap <Right> <nop>

" Quickfix Window Mappings
nnoremap <Leader>k :copen<CR>| " open quickfix window
nnoremap <Leader>j :cclose<CR>| " close quickfix window
nnoremap <Leader>l :cnext<CR>| " next quickfix item
nnoremap <Leader>h :cprev<CR>| " previous quickfix item


" === EXTERNAL TOOL INTEGRATION ===

" Configure RipGrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
  set grepformat^=%f:%l:%c:%m
endif


" === CUSTOM FUNCTIONS ===

" FZF File Search
function! Files()
    " Check if fzf is installed
    if executable('fzf')
        " Get the current working directory in Vim
        let l:cwd = getcwd()
        " Use find to list files and pipe to fzf
        if executable('bat')
          let l:selection = system('find ' . l:cwd . ' -type f | fzf --preview-window "hidden" --bind="F2:toggle-preview" --preview="bat {}"')
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

" Directory Creation Functions
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


" === AUTOCOMMANDS

autocmd VimEnter * call EnsureUndoDirExists()
autocmd VimEnter * call EnsureSystemDirExists()

