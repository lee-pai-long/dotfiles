" TODO: Need vim perl support!

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99

" turn on line number
set nu

set softtabstop=4
set tabstop=4
set shiftwidth=4

" Enable folding with the spacebar
nnoremap <space> za

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" The initial command, set foldmethod=indent, creates folds based upon line indents.
" This however often creates more folds that you wanted
" SimpylFold rectify that
Plugin 'tmhedberg/SimpylFold'

" Autoindent conforming to PEP8 standards
Plugin 'vim-scripts/indentpython.vim'

" Auto-complete for python
" Plugin 'Valloric/YouCompleteMe'

" Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'

" PEP8 syntax checking
Plugin 'nvie/vim-flake8'

" proper file tree
Plugin 'scrooloose/nerdtree'

" use tabs
Plugin 'jistr/vim-nerdtree-tabs'

" to search for basically anything from VIM
Plugin 'kien/ctrlp.vim'

"to perform basic git commands without leaving vim
Plugin 'tpope/vim-fugitive'

" Syntax highlighting, matching rules and mappings for Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" a bit of logic to define which scheme to use based upon the VIM mode
if has('gui_running')
	set background=dark
	colorscheme solarized
	call togglebg#map("<F5>")
else
	colorscheme zenburn
endif

" Python settings ------------------------------------------------------
" proper PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" FIXME: Doesn't work with pyenv-virtualenv
" python with virtualenv support
" This determines if you are running inside a virtualenv,
" and then switches to that specific virtualenv
" and sets up your system path
" so that YouCompleteMe will find the appropriate site packages
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
" EOF

" make python code look pretty
let python_highlight_all=1
syntax on

" Vagrant settings -----------------------------------------------------------
au BufNewFile,BufRead Vagrantfile set filetype=ruby

" Markdown settings ----------------------------------------------------------
au BufNewFile,BufReadPost *.md set filetype=markdown

" SaltStack settings ---------------------------------------------------------
" configure tab to two space for salt states files
au BufRead,BufNewFile *.sls set tabstop=2 expandtab

" Autocomplete settiings -----------------------------------------------------
" ensures that the autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1

" defines a shortcut for goto definition
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree settings -----------------------------------------------------------
"ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"let g:clang_user_options='|| exit 0'
