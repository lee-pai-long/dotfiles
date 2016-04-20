" -------------------------------------------------------------------------------------------
" Author: Lee Pai Long <lee-pai-long@users.noreply.github.com>
" Date:   2016-04-02 03:13:38
" Last modified by Lee Pai Long on 2016-04-20 17:41:38
" License: WTFPL <http://www.wtfpl.net/>
" -------------------------------------------------------------------------------------------


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" The initial command, set foldmethod=indent, creates folds based upon line indents.
" This however often creates more folds that you wanted
" SimpylFold rectify that
Plugin 'tmhedberg/SimpylFold'

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

" Autoindent conforming to PEP8 standards
Plugin 'vim-scripts/indentpython.vim'

" Flag Unnecessary Whitespace
" Error 'E28' : No such highlight group name: BadWhitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" Auto-complete for python
Plugin 'Valloric/YouCompleteMe'

" ensures that the autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1

" defines a shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv support
" This determines if you are running inside a virtualenv,
" and then switches to that specific virtualenv
" and sets up your system path
" so that YouCompleteMe will find the appropriate site packages

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
   project_base_dir = os.environ['VIRTUAL_ENV']
   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
   execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'

" PEP8 syntax checking
Plugin 'nvie/vim-flake8'

" make python code look pretty
let python_highlight_all=1
syntax on

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" a bit of logic to define which scheme to use based upon the VIM mode
if has('gui_running')
	set background=dark
	colorscheme solarized
	call togglebg#map("<F5>")
else
	colorscheme zenburn
endif

" proper file tree
Plugin 'scrooloose/nerdtree'

" use tabs
Plugin 'jistr/vim-nerdtree-tabs'

"ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" to search for basically anything from VIM
Plugin 'kien/ctrlp.vim'

" turn on line number
set nu

"to perform basic git commands without leaving vim
Plugin 'tpope/vim-fugitive'

" Powerline : status bar that displays things
" like the current virtualenv, git branch, files being edited, and much more.
" doc : http://powerline.readthedocs.org/en/latest/
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"let g:clang_user_options='|| exit 0'

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

set softtabstop=4
set tabstop=4
set shiftwidth=4

" Syntax highlighting, matching rules and mappings for Markdown
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" configure tab to two space for salt states files
autocmd BufRead,BufNewFile *.sls set tabstop=2 expandtab
