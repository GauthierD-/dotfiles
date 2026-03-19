return {
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"editorconfig/editorconfig-vim",
	},
	{
		"zhaocai/GoldenView.Vim",
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{ "<leader><leader>gh", ":0Gclog<cr>", desc = "Fufu" },
		},
	},
	{
		-- works with with-commentary
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = { "tpope/vim-commentary" },
	},
	{
		"tpope/vim-surround",
	},
	{
		"airblade/vim-gitgutter",
	},
	-- Plug 'junegunn/gv.vim' -- ??? i think its useless with fugitive
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			-- add options here
			-- or leave it empty to use the default settings
		},
		keys = {
			-- suggested keymap
			{ "<leader><leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
