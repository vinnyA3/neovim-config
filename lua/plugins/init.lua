local execute = vim.api.nvim_command
local fn = vim.fn
-- Initial Packer Install (clean env) 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- =========== Performance ===========
    use 'lewis6991/impatient.nvim'

    -- =========== LSP, Autocomplete and Snippets ===========
    use 'neovim/nvim-lspconfig'

    use 'L3MON4D3/LuaSnip'

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path'
      }
    }

    use 'saadparwaiz1/cmp_luasnip'

    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    -- =========== Syntax & Lang ===========
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- ========== Editing ===========
    -- use {keys = string | list}
    use {
      'tamago324/lir.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' }
    }

    use {
      'tamago324/lir-git-status.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' }
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
      event = 'BufWinEnter'
    }

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'mattn/emmet-vim'
    use 'windwp/nvim-autopairs'

    -- ========== Utilites and Editing Convenience ==========
    use "lukas-reineke/indent-blankline.nvim"
    
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }

    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim"
    }

    use 'tversteeg/registers.nvim'

    -- file navigation
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',
        },
      },
    }

    use {
      'ThePrimeagen/harpoon',
      requires = {
        'nvim-lua/plenary.nvim',
      },
    }

    use {
      'tpope/vim-fugitive',
      opt = true,
      cmd = {
        'G',
        'Git',
        'Gread',
        'Gcommit',
        'Gblame',
        'GBrowse'
      },
    }

    use 'tpope/vim-rhubarb'

    use {
      'euclio/vim-markdown-composer',
      opt = true,
      run = 'cargo build --release',
      cmd = { 'ComposerStart', 'ComposerOpen' },
      ft = 'markdown'
    } -- warning: vim-markdown-composer needs cargo installed.  Rust ftw :)

    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

    -- ========== Cosmetics ===========
    use { 'bluz71/vim-moonfly-colors', opt = true }

    use({ "catppuccin/nvim", as = "catppuccin" })

    use { 'folke/tokyonight.nvim', opt = true }

    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

    use 'hoob3rt/lualine.nvim'

    use {
      'norcalli/nvim-colorizer.lua',
      opt = true,
      cmd = { 'ColorizerToggle' } ,
      config = function()
        require('colorizer').setup()
     end
    }
  end,
  {
    config = {
      compile_path = compile_path
    }
  }
)
