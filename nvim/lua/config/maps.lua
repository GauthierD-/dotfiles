-- Description: Keymaps
-- ====================

vim.api.nvim_set_keymap("n", "gp", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F3>", ":set relativenumber!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true, silent = true })
-- Replace pasted text in visual mode without yanking it
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Copy filename to clipboard
vim.api.nvim_set_keymap("n", "<Leader><Leader>cr", ':let @+=expand("%")<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader><Leader>cf", ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Move line
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Clean search
vim.keymap.set("n", "<C-c>", ":noh<CR>", { silent = true })

-- Vim fugitive
-- vim.keymap.set("n", "<Leader><Leader>gh", ":0Gclog<CR>", { silent = true })

-- LspConfig
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gR", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader><Leader>ca",
	":lua vim.lsp.buf.code_action()<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", ":lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

-- Copilot
-- vim.api.nvim_set_keymap("i", "<Leader>cn", "<Plug>(copilot-next)", { silent = true })
-- vim.api.nvim_set_keymap("i", "<Leader>cp", "<Plug>(copilot-previous)", { silent = true })
-- vim.api.nvim_set_keymap("i", "<Leader>cd", "<Plug>(copilot-dismiss)", { silent = true })
