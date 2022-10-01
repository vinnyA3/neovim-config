local map = require('utils').map

-- Config: registers.nvim
require('registers').setup {
  window = {
    border = 'single'
  }
}

-- Config: nvim-treesitter
require('nvim-treesitter.configs').setup {
 -- TODO: check upstream if this works
  -- ensure_installed = {"typescript", "javascript", "kotlin"},
  incremental_selection = {
      enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  textobjects = { enable = true },
}

require('nvim-autopairs').setup{}

-- Config trouble.nvim 
map("n", "<leader>xx", ":Trouble<cr>")
map("n", "<leader>xw", ":Trouble lsp_workspace_diagnostics<cr>")
map("n", "<leader>xd", ":Trouble lsp_document_diagnostics<cr>")
map("n", "<leader>xl", ":Trouble loclist<cr>")
map("n", "<leader>xq", ":Trouble quickfix<cr>")
map("n", "gR", ":Trouble lsp_references<cr>")

-- Config: vim-markdown-composer 
vim.g.markdown_composer_autostart = 0

-- Config: Fugitive
map('n', '<Leader>gc', ':Gcommit<cr>', keyOpts)

-- Config: rhubarb.vim
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])

-- Config: gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add = { text = '++', numhl = 'GitSignsAddNr' },
  },
  on_attach = function(bufnr)
     local function map(mode, lhs, rhs, opts)
       opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
       vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
     end
    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
  end
}
