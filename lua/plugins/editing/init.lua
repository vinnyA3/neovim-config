local map = require('utils').map

-- Config: registers.nvim
vim.g.registers_window_border = "single"

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

-- Config: gitsigns 
require('gitsigns').setup {
  signs = {
    add = { text = '++', numhl='GitSignsAddNr' },
  }
}

-- Config: vim-markdown-composer 
vim.g.markdown_composer_autostart = 0

-- Config: Fugitive
map('n', '<Leader>gc', ':Gcommit<cr>', keyOpts)

-- Config: rhubarb.vim
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])
