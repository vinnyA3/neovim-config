-- Main Import for Lazy Nvim

return {
    -- =========== LSP, Autocomplete and Snippets ===========
    'neovim/nvim-lspconfig',
    {
      'williamboman/mason.nvim',
      config = function()
        require('mason').setup({
          ui = {
            border = 'rounded'
          }
        })
      end
    },
    'L3MON4D3/LuaSnip',
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path'
      }
    },
    'saadparwaiz1/cmp_luasnip',
   {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim'
      }
    },
    -- =========== Syntax & Lang ===========
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- ========== Editing ===========
    {
      'tamago324/lir.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' }
    },
    {
      'tamago324/lir-git-status.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' }
    },
     {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
      event = 'BufWinEnter'
    },
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    'mattn/emmet-vim',
    'windwp/nvim-autopairs',
    -- ========== Utilites and Editing Convenience ==========
    'lukas-reineke/indent-blankline.nvim',
    {
      "folke/trouble.nvim",
      dependencies = "kyazdani42/nvim-web-devicons"
    },
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim"
    },
    'tversteeg/registers.nvim',
    -- file navigation
     {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
        },
      },
    },
    {
      'ThePrimeagen/harpoon',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
    },
    {
      'tpope/vim-fugitive',
      lazy = true,
      cmd = {
        'G',
        'Git',
        'Gread',
        'Gcommit',
        'Gblame',
        'GBrowse'
      },
    },
    'tpope/vim-rhubarb',
    {
      'euclio/vim-markdown-composer',
      lazy = true,
      build = 'cargo build --release',
      cmd = { 'ComposerStart', 'ComposerOpen' },
      ft = 'markdown'
    }, -- warning: vim-markdown-composer needs cargo installed.  Rust ftw!
    {
      'goolord/alpha-nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
      "mickael-menu/zk-nvim",
      config = function()
        require("zk").setup({
          picker = "telescope",
          lsp = {
            config = {
              cmd = { "zk", "lsp" },
              name = "zk",
              on_attach = function(client, bufnr)
                local borderStyle = "rounded"

                vim.lsp.handlers["textDocument/hover"] =
                  vim.lsp.with(vim.lsp.handlers.hover, { border = borderStyle })

                vim.diagnostic.config({
                  float = {
                    source = 'always',
                    border = borderStyle
                  }
                })
              end
            }
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          }
        })
      end
    },
    { 'glacambre/firenvim', build = function() vim.fn['firenvim#install'](0) end },
    -- ========== Cosmetics ===========
    -- 'folke/tokyonight.nvim',
    { "catppuccin/nvim", name = "catppuccin" },
    { 'lewis6991/gitsigns.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    'hoob3rt/lualine.nvim',
    {
      'norcalli/nvim-colorizer.lua',
      lazy = true,
      cmd = 'ColorizerToggle',
      config = function()
        require('colorizer').setup()
     end
    }

}
