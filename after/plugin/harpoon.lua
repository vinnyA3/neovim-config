local map = require('vin.utils').map

require('harpoon').setup{}

map("n", "<leader>a", ":lua require'harpoon.mark'.add_file()<CR>")
map("n", "<C-e>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>")
