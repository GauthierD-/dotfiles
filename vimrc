" le vimrc pour les autres utilisateurs est ici: /usr/share/vim/vimrc
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

" Whitespace
set nowrap
set tabstop=4 shiftwidth=4
set expandtab
set backspace=indent,eol,start

" SWAGG
" set colorcolumn=81
set relativenumber

"Vim-javascript
let g:html_indent_inctags = "html, body, head, tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"Vim powerline
let g:Powerline_symbols = "unicode"
set laststatus=2
set t_Co=256

"Vim EJS
au BufNewFile,BufRead *.ejs set filetype=js
au BufnewFile,BufRead *.ejs set filetype=html
