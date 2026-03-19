-- Swag {{{
-------------------------------------------------------------------------------
vim.o.scrolloff = 999 - vim.o.scrolloff
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
-- vim.cmd("highlight CursorLine cterm=bold ctermfg=none")
-- Apres linstall le mettre dans le plugin
-- vim.g.goldenview__enable_default_mapping = 0
-- }}}

-- Colors {{{
-------------------------------------------------------------------------------
vim.opt.background = "dark"
vim.opt.termguicolors = true -- Enable true colors support
-- }}}

-- Whitespace {{{
-------------------------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.backspace = "indent,eol,start"
-- }}}

-- enable folding {{{
-------------------------------------------------------------------------------
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "syntax"
-- Test stackoverflow
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- }}}

-- Searching {{{
-------------------------------------------------------------------------------
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- }}}

-- Extras {{{
-------------------------------------------------------------------------------
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.exrc = true -- vimrc by project
-- prevent :autocmd, shell and write commands
-- from being run inside project-specific .vimrc
vim.opt.secure = true
-- }}}
