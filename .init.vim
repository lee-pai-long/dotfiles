" Neovim config

" let NVIM_DIR              = "$HOME/.nvim/"
" let REPO_DIR              = NVIM_DIR . "repos"
" let GITHUB                = "https://github.com"
" let SHOUGO_DIR            = "Shougo"
" let PLUGIN_MANAGER_SCRIPT = "dein.vim"
" let SHOUGO_GH             = GITHUB . "/" . SHOUGO_DIR . "/"
" let PLUGIN_MANAGER_GH     = SHOUGO_GH . PLUGIN_MANAGER_SCRIPT
" let PLUGIN_MANAGER        = SHOUGO_DIR . "/" . PLUGIN_MANAGER_SCRIPT

set termguicolors

" Setup NeoBundle  ----------------------------------------------------------{{{
" If vundle is not installed, do it first
  if (!isdirectory(expand("$HOME/.nvim/repos/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.nvim/repos/"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.nvim/repos/Shougo/dein.vim"))
  endif


set nocompatible "see: https://goo.gl/MvEHIa
set encoding=utf-8
set mouse=a "Mouse support
map <C-c> "+y<CR>

" Required:
    set runtimepath+=~/.nvim/repos/Shougo/dein.vim/

" Required:
    call dein#begin(expand('~/.nvim'))
    let pluginsExist = 0

" Required:
    "call dein#add(PLUGIN_MANAGER)
    call dein#add('Shougo/dein.vim')

    "utility commands of dein.vim with rich completion. https://goo.gl/JlFNan
    call dein#add('haya14busa/dein-command.vim')

    "syntax
    call dein#add('scrooloose/syntastic') "https://goo.gl/yYwn7k
    call dein#add('flazz/vim-colorschemes')
    call dein#add('hdima/python-syntax')


    "git utils
    call dein#add('tpope/vim-fugitive') "https://goo.gl/cUFlvx
    call dein#add('airblade/vim-gitgutter') "https://goo.gl/1z6Mwd

    "python utils
    call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'}) "https://goo.gl/ZERke2
    " Autoindent conforming to PEP8 standards
    call dein#add('vim-scripts/indentpython.vim')
    " PEP8 syntax checking
    call dein#add('nvie/vim-flake8')

    " Syntax highlighting, matching rules and mappings for Markdown
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')

    " ide tools
    call dein#add('scrooloose/nerdtree') "https://goo.gl/bYd7z2
    call dein#add('Xuyuanp/nerdtree-git-plugin') "https://goo.gl/3Y9WFL
    call dein#add('Yggdroot/indentLine') "https://goo.gl/vavjYq
    call dein#add('editorconfig/editorconfig-vim') "https://goo.gl/qYWvCD

    call dein#add('vim-airline/vim-airline') "https://goo.gl/oDbhAn
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('tpope/vim-surround') "https://goo.gl/pXfZ92
    call dein#add('tomtom/tcomment_vim') "https://goo.gl/Ow6NYH
    call dein#add('Shougo/denite.nvim') "https://goo.gl/DIJXX4
    call dein#add('Shougo/unite-outline') "https://goo.gl/tyjg8y
    call dein#add('Shougo/deoplete.nvim') "https://goo.gl/2gR3m6
    call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('ujihisa/neco-look')
    call dein#add('zchee/deoplete-jedi')

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('honza/vim-snippets')
    call dein#add('mattn/gist-vim')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('ctrlpvim/ctrlp.vim')
    
	" use tabs with nerdtree
    call dein#add('jistr/vim-nerdtree-tabs')

    " perl support
	call dein#add('vim-perl/vim-perl') "https://goo.gl/KlaOVI


    if dein#check_install()
        call dein#install()
    endif
    call dein#end()

" Required:
    filetype plugin indent on
" }}}


set nu " turn on line number
set foldmethod=indent " Enable folding
set foldlevel=99

set softtabstop=4
set tabstop=4
set shiftwidth=4

nnoremap <space> za " Enable folding with the spacebar

" Python settings ------------------------------------------------------
" proper PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
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
colorscheme zenburn
highlight Normal ctermbg=NONE guibg=NONE

" Vagrant settings -----------------------------------------------------------
au BufNewFile,BufRead Vagrantfile set filetype=ruby

" Markdown settings ----------------------------------------------------------
au BufNewFile,BufReadPost *.md set filetype=markdown

" SaltStack settings ---------------------------------------------------------
" configure tab to two space for salt states files
au BufRead,BufNewFile *.sls set tabstop=2 expandtab

" NERDTree settings -----------------------------------------------------------
"ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd vimenter * NERDTree "Auto start NERDTree
autocmd VimEnter * wincmd p "Auto focus on file
"let g:NERDTreeMouseMode=3
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_autoclose=1
let NERDTreeMinimalUI = 1 "Remove Help
autocmd bufenter * if (winnr("$") == 1
    \ && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif "Close NERDTree

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'zenburn'
let g:airline_powerline_fonts=1


"		==== syntastic ====
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_python_flake8_args='--ignore=E501,E225,E251,E221'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
