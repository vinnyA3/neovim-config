local map = require('vin.utils').map

-- Config: Fugitive
map('n', '<Leader>gc', ':Gcommit<cr>', keyOpts)

-- Config: rhubarb.vim
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])
