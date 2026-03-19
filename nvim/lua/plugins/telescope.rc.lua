return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules" },
			},
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.load_extension("fzf")

			vim.keymap.set("n", ";f", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", ";r", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", ";s", builtin.grep_string, { desc = "Telescope grep string" })
			vim.keymap.set("n", "\\\\", builtin.git_status, { desc = "Telescope git status" })
			vim.keymap.set("n", ";;", builtin.buffers, { desc = "Telescope buffer" })
		end,
	},
}
