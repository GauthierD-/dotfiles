call pathogen#infect()

filetype plugin indent on
filetype plugin on

set nocompatible
syntax enable
set encoding=utf-8
set shortmess=at
set showcmd
set mouse=a
set ttymouse=xterm2
" set clipboard=unnamed
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

" Vim powerline
let g:Powerline_symbols = "unicode"
set laststatus=2
set noshowmode
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" NerdTree config
let g:NERDTreeWinSize=40

" DelimitMate config
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_expand_inside_quote = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_jump_expansion =1
let g:delimitMate_matchparis = "(:),[:],{:},<:>"

" vim-jsx
let g:jsx_ext_required = 0

" Syntastic
" to avoid conflict with powerline Statusline code inside
" .config/pownerline/themes/vim/default.json
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_yaml_checkers = ['jsyaml', 'yamllint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 7
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

" Mappings
let mapleader = ","
nmap <leader>ev :vsplit $MYVIMRC<CR>
nmap gp :tabprevious<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :NumbersToggle<CR>
nmap <F7> :Matrix<CR>
nmap <silent><C-k> :m .-2<CR>
nmap <silent><C-j> :m .+1<CR>
nmap <silent> <C-c> :nohl<CR>
nmap <leader><leader>w :w<CR>
nmap <leader><leader>f :NERDTreeFind<CR>

" prevent :autocmd, shell and write commands
" from being run inside project-specific .vimrc 
set secure

" OLD plugins remove soon
" let g:EasyMotion_leader_key = '<leader>'
" set runtimepath^=~/.vim/bundle/ctrlp.vim
"
" Vim Markdown
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Vim-json
" let g:indentLine_noConcealCursor=""
" let g:vim_json_syntax_conceal = 0

" nmap <Leader>w <Plug>(easymotion-w)
" nmap <Leader>j <Plug>(easymotion-j)

