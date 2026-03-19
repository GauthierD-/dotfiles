return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = false,
					disable = {},
				},
				ensure_installed = {
					"vim",
					"tsx",
					"json",
					"python",
					"html",
					"yaml",
					"typescript",
					"javascript",
					"graphql",
					"lua",
				},
			})
		end,
	},
}
