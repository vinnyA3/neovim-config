-- This file houses those one-line config setups, related to editing
-- experience plugins
local map = require('vin.utils').map

-- Config: registers.nvim
require('registers').setup {
  window = {
    border = 'single'
  }
}

-- Config: nvim-autopairs
require('nvim-autopairs').setup{}

-- Config: Oil.nvim
require("oil").setup({
  columns = {
    "icon",
  },
  win_options = {
    signcolumn = "yes:2",
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<M-h>"] = "actions.select_split",
  },
  view_options = {
    show_hidden = true,
  },
})

require('oil-git-status').setup({
 show_ignored = true
})

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory"})

-- Config: vim-markdown-composer
vim.g.markdown_composer_autostart = 0
