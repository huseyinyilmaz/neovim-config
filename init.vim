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
set textwidth=79
set colorcolumn=79

set completeopt=menu,noinsert,noselect

" Set title to window
set title

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
Plug 'neomake/neomake'
" prefer local eslint before trying global eslint
Plug 'benjie/neomake-local-eslint.vim'

"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-vinegar'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
call plug#end()


" THEME
"=====================
colorscheme base16-solarized-dark

"==============plugin configurations========"


"deoplete-jedi
let g:python_host_prog = expand('~/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog = expand('~/.virtualenvs/neovim3/bin/python')
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

"Neo-make setup---------------------------
" Run linter on write
autocmd! BufWritePost * Neomake
" Add makers
let g:neomake_javascript_enabled_makers = ['eslint']




