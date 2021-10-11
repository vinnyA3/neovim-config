-- Plugin Configurations
-- =====================
-- You'll find all initial configs & setups here,
-- as well as custom plugin keybindings!

local map = vim.api.nvim_set_keymap
local keyOpts = { silent = true, noremap = true }

require('impatient')

-- Config: alpha
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
  [[  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
  [[  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
  [[  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
  [[  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
  [[  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
}

dashboard.section.footer.val = {
  [[]],
  [[]],
  [[         ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀   ]],
  [[       ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷  ]],
  [[      ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿  ]],
  [[     ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿  ]],
  [[   ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿  ]],
  [[  ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿  ]],
  [[  ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟  ]],
  [[  ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣  ]],
  [[  ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾  ]],
  [[  ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿  ]],
  [[  ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿  ]],
  [[  ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿  ]],
  [[  ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿  ]],
  [[   ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃  ]],
  [[  ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉             ]],
}

dashboard.section.buttons.val = {
  dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "Leader fh", "  Find history" , ":History<CR>"),
  dashboard.button( "Leader ff", "  Find file" , ":Files<CR>"),
  dashboard.button( "Leader fa", "  Find word" , ":Rg<CR>"),
  dashboard.button( "q", "  Quit" , ":q<CR>"),
}

alpha.setup(dashboard.opts)

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

-- Config: cmp
local cmp = require 'cmp'

cmp.setup {
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp', priority = 100 },
    { name = 'path' }
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
      })[entry.source.name]

      return vim_item
    end
  }
}

-- Config: moonfly
-- vim.g.moonflyTransparent = 1

-- Config tokyonight
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_italic_functions = false
-- vim.cmd[[colorscheme tokyonight]]

-- Config nightfox
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

-- Config: FZF
map('n', '<C-p>', ':Files<cr>', keyOpts)
map('n', '<Leader>b', ':Buffers<cr>', keyOpts)
map('n', '<Leader>fh', ':History<cr>', keyOpts)
map('n', '<Leader>fa', ':Rg<cr>', keyOpts)

-- Config: netrw (disable)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Config: rhubarb.vim
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])

-- TODO: might need new scope, custom autocmd group seems out of place here
--   used to close extra buffers, spawned by git, when using NVR
vim.api.nvim_exec(
  [[ autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete ]],
  false
)
