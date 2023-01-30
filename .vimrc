" TODO: Need vim perl support!

set nocompatible              " required
filetype off                  " required

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
