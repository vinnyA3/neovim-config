-- Plugin Configurations
-- =====================
-- You'll find all initial configs & setups here,
-- as well as custom plugin keybindings!

local map = vim.api.nvim_set_keymap
local keyOpts = { silent = true, noremap = true }

require('impatient')

-- Config: indent-blankline
require('indent_blankline')

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

-- Config: compe
require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  allow_prefix_unmatch = false;
  source = {
    path = true;
    buffer = true;
    vsnip = false;
    nvim_lsp = true;
    nvim_lua = false;
  };
}

-- Config: moonfly
-- vim.g.moonflyTransparent = 1

-- Config tokyonight
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_italic_functions = false
-- vim.cmd[[colorscheme tokyonight]]

-- Config nightfox
-- From lua
local nightfox = require('nightfox')
nightfox.load()
nightfox.setup({
  fox = "nightfox", -- Which fox style should be applied
  transparent = false, -- Disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening :terminal
  styles = {
    comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
    functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
    keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
    strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
    variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
  },
})

-- Config trouble.nvim 
map("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- Config: lualine.nvim
require('lualine').setup {
  options = {
    theme = 'nightfox';
    icons_enabled = true;
    section_separators = {'', ''};
    component_separators = {'|', '|'};
  }
}

-- Config: Lspsaga
require('lspsaga').init_lsp_saga {
  border_style = "single"
}

map('n', 'gh', ':Lspsaga lsp_finder<cr>', keyOpts)
map('n', 'K',  ':Lspsaga hover_doc<cr>', keyOpts)
map('n', 'gs', ':Lspsaga signature_help<cr>', keyOpts)
map('n', 'gr', ':Lspsaga rename<cr>', keyOpts)
map('n', 'gd', ':Lspsaga preview_definition<cr>', keyOpts)
map('n', 'gl', ':Lspsaga show_line_diagnostics<cr>', keyOpts)
map('n', 'ca', ':Lspsaga code_action<cr>', keyOpts)

-- -- Config: formatter
local commonJSConfig = {
  function()
    return {
      exe = 'prettier',
      args = {
        '--config-precedence',
        'prefer-file',
        '--stdin-filepath',
        vim.api.nvim_buf_get_name(0),
        '--single-quote'
      },
      stdin = true
    }
  end
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = commonJSConfig,
    typescript = commonJSConfig,
    javascriptreact = commonJSConfig,
    typescriptreact = commonJSConfig,
  }
})

-- Config: colorizer
-- require('colorizer').setup {
--   'javascript';
--   'typescript';
--   'css';
--   javascript = { css = true; };
--   typescript = { css = true; };
--   css = { rgb_fn = true; };
-- }

-- Config: indent-blankline
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype = {
  'lua',
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'lua',
  'json',
  'yaml',
  'html',
  'swift',
  'c',
  'python',
  'dockerfile',
  'haskell',
}

-- Config: gitsigns 
require('gitsigns').setup {
  signs = {
    add = { text = '++', numhl='GitSignsAddNr' },
  }
}

-- Config: lir 
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<CR>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)

      return {
        border = require("lir.float.helper").make_border_opts({
          "+", "─", "+", "│", "+", "─", "+", "│",
        }, "Normal"),
        width = width,
        height = height,
        row = 1,
        col = math.floor((vim.o.columns - width) / 2),
      }
    end
  },
  hide_cursor = true,
}

map('n', '<Leader>F', ":lua require'lir.float'.toggle()<CR>", keyOpts)
map('n', '-', [[<CMD>execute 'e ' .. expand('%:p:h')<CR>]], keyOpts) -- netrw/dirvish file exp functionality

-- Config: lir-git-status
require'lir.git_status'.setup({ show_ignored = false })

-- Config: vim-markdown-composer 
vim.g.markdown_composer_autostart = 0

-- Config: Fugitive
map('n', '<Leader>gc', ':Gcommit<cr>', keyOpts)

-- Config: Dashboard
vim.g.dashboard_default_executive = 'fzf'
vim.g.dashboard_custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}
vim.g.dashboard_custom_footer = {
  '        ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀  ',
  '      ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷ ',
  '     ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ ',
  '    ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ ',
  '  ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ ',
  ' ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ ',
  ' ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ ',
  ' ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ ',
  ' ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ ',
  ' ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ ',
  ' ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ ',
  ' ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ ',
  ' ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ ',
  '  ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃ ',
  ' ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ',
  '',
  '',
}

map('n', '<Leader>fh', ':DashboardFindHistory<CR>', keyOpts)
map('n', '<Leader>ff', ':DashboardFindFile<CR>', keyOpts)
map('n', '<Leader>tc', ':DashboardChangeColorscheme<CR>', keyOpts)
map('n', '<Leader>fa', ':DashboardFindWord<CR>', keyOpts)
map('n', '<Leader>fb', ':DashboardJumpMark<CR>', keyOpts)
map('n', '<Leader>cn', ':DashboardNewFile<CR>', keyOpts)

-- Config: FZF
map('n', '<C-p>', ':Files<cr>', keyOpts)
map('n', '<Leader>b', ':Buffers<cr>', keyOpts)
map('n', '<Leader>h', ':History<cr>', keyOpts)
map('n', '<Leader>r', ':Rg<cr>', keyOpts)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 -- don't load default netrw

-- Config: rhubarb.vim
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])

-- TODO: might need new scope, custom autocmd group seems out of place here
--   used to close extra buffers, spawned by git, when using NVR
vim.api.nvim_exec(
  [[ autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete ]],
  false
)
