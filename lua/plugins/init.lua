local execute = vim.api.nvim_command
local fn = vim.fn
-- Initial Packer Install (clean env) 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua'

-- MACOS - lusrocks installs using incorrect luaversion, unless specified
fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- =========== Performance ===========
    use {
      'lewis6991/impatient.nvim',
      commit = '561b86e5602def047010d451c3e7977a65982788',
      lock = true,
      rocks = "mpack"
    }

    -- =========== LSP and Autocomplete ===========
    use 'neovim/nvim-lspconfig'
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path'
      }
    }

    -- =========== Syntax & Lang ===========
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'keith/swift.vim', opt = true, ft = 'swift' }

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

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'mattn/emmet-vim'
    use 'jiangmiao/auto-pairs' -- TODO: find lua alternative

    -- ========== Utilites and Editing Convenience ==========
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { 'Trouble', 'TroubleToggle' },
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      opt = true,
      cmd = { 'TodoQuickFix', 'TodoTrouble' },
      config = function()
        require('todo-comments').setup{}
      end
    }
    use { 'junegunn/vim-peekaboo', keys = '"' } -- TODO: find a nice lua alternative, if possible
    use {
      'junegunn/fzf.vim',
      requires = 'junegunn/fzf'
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

    -- ========== Formatters ==========
    use 'mhartington/formatter.nvim'

    -- ========== Cosmetics ===========
    use { 'bluz71/vim-moonfly-colors', opt = true }
    use 'EdenEast/nightfox.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'hoob3rt/lualine.nvim'

    use {
      'norcalli/nvim-colorizer.lua',
      opt = true,
      ft = { 'css', 'scss' },
      config = function()
        require('colorizer').setup { -- TODO: export config & load here
          'javascript';
          'typescript';
          'css';
          javascript = { css = true; };
          typescript = { css = true; };
          css = { rgb_fn = true; };
        }
     end
    }
  end,
  {
    compile_path = compile_path
  }
)
