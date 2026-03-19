return {
	{
		"mhartington/formatter.nvim",
		config = function(_)
			require("formatter").setup({
				logging = true,
				filetype = {
					javascript = {
						require("formatter.filetypes.javascript").prettier,
					},
					javascriptreact = {
						require("formatter.filetypes.javascriptreact").prettier,
					},
					typescript = {
						require("formatter.filetypes.typescript").prettier,
					},
					typescriptreact = {
						require("formatter.filetypes.typescript").prettier,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					json = {
						require("formatter.filetypes.json").prettier,
					},
					markdown = {
						require("formatter.filetypes.markdown").prettier,
					},
					python = {
						require("formatter.filetypes.python").black,
					},
				},
			})
		end,
	},
}
