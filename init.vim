scriptencoding utf-8

"============ Vim Config ===================="
"shoe line numbers
set number
set norelativenumber

"no modeline
set nomodeline

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" tab length for different file types.
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" More Common Settings.
"set noshowmode
set showcmd
set hidden
set visualbell
"Settings for Searching and Moving
set ignorecase
set smartcase
set showmatch
set hlsearch

" Make Vim to handle long lines nicely.
set wrap
"set textwidth=79
"set colorcolumn=79
set foldmethod=syntax
set foldlevel=99

set completeopt=menu,noinsert,noselect
" Set title to window
set title

"CUSTOM KEYS
" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
"============plugin setup================="
call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

"# Navigation"
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-vinegar'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'

Plug 'ntpeters/vim-better-whitespace'
Plug 'flowtype/vim-flow', {'autoload': {'filetypes': 'javascript'}}
Plug 'tpope/vim-fugitive'
Plug 'stanangeloff/php.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jceb/vim-orgmode'
Plug 'ervandew/supertab'
call plug#end()


" THEME
"=====================
" colorscheme base16-solarized-dark
" colorscheme base16-default-dark
colorscheme base16-google-dark

"==============plugin configurations========"

let g:python_host_prog = expand('~/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog = expand('~/.virtualenvs/neovim3/bin/python')
"vim-flow configuration-------------------
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

let g:flow#autoclose = 1

" vim-javascript--------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" tern_for_vim----------------------------
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'

""ane--------------------------------------
set nocompatible
filetype off

let &runtimepath.=',~/.config/nvim/bundled/ale'
" use flake8 from virtualenv
" let g:ale_python_flake8_executable = $VIRTUAL_ENV . '/bin/flake8'
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_args = '-m flake8'

filetype plugin on
"deoplete-jedi
"let g:python3_host_prog = '/Users/mert/.virtualenvs/neovim3/bin/python'
"deoplete---------------------------------
let g:deoplete#enable_at_startup = 1

"neosnippet-------------------------------
let g:neosnippet#enable_completed_snippet = 1

" Fuzzy Finder ---------------------------
let g:fzf_command_prefix = 'FF'

" Autoclose ------------------------------
" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------
" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'
