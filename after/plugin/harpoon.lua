local map = require('vin.utils').map

require('harpoon').setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  }
})

map("n", "<leader>ha", ":lua require'harpoon.mark'.add_file()<CR>")
map("n", "<leader>hh", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>")
