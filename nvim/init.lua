-- Pre setup
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("config.setup")
-- Load lazy nvim package manager
require("config.lazy")
require("config.maps")

-- deno_ls
-- highlight codefences returned from denols
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
	pattern = { "*.ts", "*.tsx", "*.js", "*.mjs", "*.jsx", "*.rs", "*.lua", "*.md", "*.json", "*.py" },
})
