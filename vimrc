execute pathogen#infect()

filetype plugin indent on
filetype plugin on

set nocompatible
syntax enable
set encoding=utf-8
set shortmess=at
set showcmd
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif
set nopaste
set cmdheight=2
set exrc " vimrc by project

" Abbreviations
:iabbrev @@     g.deroo@gmail.com
:iabbrev nnick  GauthierD-

" Whitespace
set expandtab
set nowrap
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start

" backup files
set backup
set backupdir=/home/gauthierd/.vim/backup,/tmp
set writebackup
set noswapfile

" SWAGG
colorscheme SolarizedDark
let &scrolloff=999-&scrolloff
set colorcolumn=80
set relativenumber
set number
set cursorline
hi CursorLine cterm=bold ctermfg=none
"
" enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Searching
set hlsearch
set incsearch
set ignorecase

" fzf
set rtp+=/usr/local/opt/fzf


" NerdTree config
let g:NERDTreeWinSize=40

" Personal commnand
command! -nargs=* Blame call s:GitBlame()

function! s:GitBlame()
    let cmd = "git blame -w " . bufname("%")
    let nline = line(".") + 1
    botright new
    execute "$read !" . cmd
    execute "normal " . nline . "gg"
    execute "set filetype=perl" 
endfunction

" DelimitMate config
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_expand_inside_quote = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_jump_expansion =1
let g:delimitMate_matchparis = "(:),[:],{:},<:>"

" search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ale (Asynchronous Lint Engine)
" :lopen > open error list
" :lclose > close error list
" :lne > next error
" :lpe > previous error
" let g:ale_open_list = 1
" let g:ale_fix_on_save = 1
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '💩'
let g:ale_echo_msg_error_str = '❗️'
let g:ale_echo_msg_warning_str = '💩'
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'javascript':  ['eslint'], 'javascriptreact': ['eslint']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Nvim coc
" let g:coc_force_debug = 1

" Mappings
let mapleader = ","
nmap <leader>ev :vsplit $MYVIMRC<CR>
nmap gp :tabprevious<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :NumbersToggle<CR>
nmap <F6> <Plug>(ale_fix)
nmap <F7> :Matrix<CR>
nmap <silent><C-k> :m .-2<CR>
nmap <silent><C-j> :m .+1<CR>
nmap <silent> <C-c> :nohl<CR>
nmap <leader><leader>w :w<CR>
nmap <leader><leader>f :NERDTreeToggle<CR>
nnoremap <leader><leader>p :Files<CR>
nnoremap <leader><leader>b :Buffers<CR>
nnoremap <leader><leader>h :History<CR>
nnoremap <leader><leader>t :BTags<CR>
nnoremap <leader><leader>T :Tags<CR>
nnoremap <leader><leader>gb :Blame



" prevent :autocmd, shell and write commands
" from being run inside project-specific .vimrc 
set secure
