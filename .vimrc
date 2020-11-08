" Pathogen plugin
call pathogen#infect()
syntax on
filetype plugin indent on

" Make Nerdtree automatically start
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map Nerdtree Ctrl-F to toggel the tree directory
nmap<C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle 

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Auto Indent
set autoindent
set textwidth=80

" Set Line Numbers
set number
