" le vimrc pour les autres utilisateurs est ici: /usr/share/vim/vimrc
" le .vimrc du dossier home de l'utilisateur a la prioritité
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
filetype plugin on
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict 

set nocompatible
syntax enable
set encoding=utf-8
set showcmd
set mouse=a
colorscheme SolarizedDark

" Abbreviations
:iabbrev @@     g.deroo@gmail.com
:iabbrev nnick  GauthierD-

" Whitespace
set expandtab
set nowrap
set tabstop=4 shiftwidth=4
set backspace=indent,eol,start

" backup files
set backup
set backupdir=/home/gauthierd/.vim/backup,/tmp
set writebackup
set noswapfile

" SWAGG
set colorcolumn=81
set relativenumber
let &scrolloff=999-&scrolloff
" set cursorline

" Searching
set hlsearch
set incsearch
set ignorecase

" Vim powerline
let g:Powerline_symbols = "unicode"
set laststatus=2
set t_Co=256
set noshowmode
set fillchars+=stl:\ , stlnc:\

" Powerline configuration
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Vim markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Vim neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Vim json
let g:indentLine_noConcealCursor=""
let g:vim_json_syntax_conceal = 0

" Vim jshint2
set runtimepath+=/.vim/bundle/jshint2.vim/
let jshint2_save = 1
let jshint2_min_height = 3
let jshint2_max_height = 10
let jshint2_color = 1

" DelimitMate
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_expand_inside_quote = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_matchparis = "(:),[:],{:},<:>"

" Nerdtree
let g:NERDTreeWinSize = 40;


let mapleader = ","
" Eddit my vimrc faster
nmap <leader>ev :vsplit $MYVIMRC<CR>

" Mappings
nmap gp :tabprevious<CR>
nnoremap <F3> :NumbersToggle<CR>
nmap <F12> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F7> :Matrix<CR>
" SOON FUCK THAT nnoremap <F5> :GundoToggle<CR>
let g:EasyMotion_leader_key = '<leader>'
nmap <silent><C-Up> :m .-2<CR>
nmap <silent><C-Down> :m .+1<CR>
nnoremap <silent><C-s> :w<CR>
nnoremap <silent> <C-c> :nohl<CR><C-l>
nnoremap <Leader>m :w <Bar> !lessc -x -sm=on % > %:t:r.css<CR><space>
set runtimepath^=~/.vim/bundle/ctrlp.vim

" seetab toggles between showing tabs and using standard listchars
fu! SeeTab()
	if !exists("g:SeeTabEnabled")
		let g:SeeTabEnabled = 1
		let g:SeeTab_list = &list
		let g:SeeTab_listchars = &listchars
		let regA = @a
		redir @a
		" hi SpecialKey
		" redir END
		" let g:SeeTabSpecialKey = @a
		" let @a = regA
		" silent! hi SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=magenta
		set list
		set listchars=tab:\|\
	else
		let &list = g:SeeTab_list
		let &listchars = &listchars
		silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
		unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
	endif
endfunc
com! -nargs=0 SeeTab :call SeeTab()

" nnoremap <S-a> :SeeTab <CR> 
