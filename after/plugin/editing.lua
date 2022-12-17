-- This file houses those one-line config setups, related to editing
-- experience plugins

-- Config: registers.nvim
require('registers').setup {
  window = {
    border = 'single'
  }
}

-- Config: nvim-autopairs 
require('nvim-autopairs').setup{}

-- Config: vim-markdown-composer
vim.g.markdown_composer_autostart = 0
