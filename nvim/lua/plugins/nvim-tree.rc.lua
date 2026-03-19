return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    opts = {
      -- on_attach = on_attach_change,
      -- disables netrw completely
      disable_netrw       = true,
      ---- hijack netrw window on startup
      hijack_netrw        = true,
      ---- hijack the cursor in the tree to put it at the start of the filename
      hijack_cursor       = false,
      tab = {
        sync = {
          -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
          open            = true,
        }
      },
      view = {
        width = "25%",
      }
    },
    keys =
    {
      {'<leader><leader>f', "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree - open"},
      {'<leader><leader>c', "<cmd>NvimTreeClose<cr>", desc = "NvimTree - close"},
    },
  }
}
