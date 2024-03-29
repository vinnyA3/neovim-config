local map = require('vin.utils').map

-- === LEADER ===
map('n', '<Space>', '', {})
map('v', '<Space>', '', {})

-- Easy Buffer manipulations
map('n', '<leader>d', ':bd<cr>', opts)
map('n', '<leader>o', ':%bd|e#<cr>', opts) -- close all buffers(%), open last for editing(e#) : mnemonic 'o' -> only

-- Easy Window Navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Easy Window Navigation (when in terminal)
map('t', '<C-h>', '<C-w>h', opts)
map('t', '<C-j>', '<C-w>j', opts)
map('t', '<C-k>', '<C-w>k', opts)
map('t', '<C-l>', '<C-w>l', opts)

-- Relative number toggle
map('n', '<leader>E', ':exec &rnu? "se rnu!" : "se rnu"<cr>', opts)

-- <Tab> & <S-Tab> to navigate the completion menu
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })

-- read escape in terminal .. double tap to go back to insert mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', opts)

-- window resize
map('n', '<Up>', ':resize -5<CR>', opts)
map('n', '<Down>', ':resize +5<CR>', opts)
map('n', '<Left>', ':vertical resize -5<CR>', opts)
map('n', '<Right>', ':vertical resize +5<CR>', opts)

-- 'fullscreen' buffer (open current buffer in new tab)
-- nmap (leader + z)  for fulltab
map('n', '<leader>z', ':tab split<CR>', opts)

-- split terminal (horizontal)
map('n', '<leader>T', ':sp | term<CR>', opts)

-- find and replace all occurences of focused word, in current buffer
map('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/', opts)

-- copy current file name(+path) to primary clip register
map('n', ',cf', ':let @*=expand("%:p")<CR>', opts)
