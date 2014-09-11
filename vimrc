"77 le vimrc pour les autres utilisateurs est ici: /usr/share/vim/vimrc
" le .vimrc du dossier home de l'utilisateur a la prioritité
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict 

set nocompatible
syntax enable
set encoding=utf-8
set showcmd
colorscheme SolarizedDark 

" Abbreviations
:iabbrev @@     g.deroo@gmail.com
:iabbrev nnick  GauthierD-

" Whitespace
set nowrap
set tabstop=4 shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
set mouse=a

" backup files
set backup
set backupdir=/home/gauthierd/.vim/backup,/tmp
set writebackup
set noswapfile

" SWAGG
set colorcolumn=81
set relativenumber
" set cursorline

" Searching
set hlsearch
set incsearch
set ignorecase

" Vim-javascript
let g:html_indent_inctags = "html, body, head, tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Vim powerline
let g:Powerline_symbols = "unicode"
set laststatus=2
set t_Co=256

" Vim EJS
au BufNewFile,BufRead *.ejs set filetype=js
au BufnewFile,BufRead *.ejs set filetype=html

let mapleader = ","
" Eddit my vimrc faster
nmap <leader>ev :vsplit $MYVIMRC<CR>

" Mappings
nnoremap <F3> :NumbersToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F11> :Matrix<CR>
" SOON FUCK THAT nnoremap <F5> :GundoToggle<CR>
let g:EasyMotion_leader_key = '<leader>'
nmap <C-Down> :m .+1<CR>
nmap <C-Up> :m .-2<CR>
nnoremap <silent> <C-c> :nohl<CR><C-c>
