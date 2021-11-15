-- =============== DASHBOARD ===================
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
  dashboard.button("e", "  New file" , ":ene <BAR> startinsert <cr>"),
  dashboard.button("Leader fh", "  Find history"),
  dashboard.button("Leader ff", "  Find file" , ":Telescope find_files<cr>"),
  dashboard.button("Leader fa", "  Find word" , ":Telescope live_grep<cr>"),
  dashboard.button("q", "  Quit" , ":q<cr>"),
}

alpha.setup(dashboard.opts)

-- =============== STATUSLINE ==================
require('lualine').setup {
  options = {
    theme = 'tokyonight';
    icons_enabled = true;
    section_separators = {'', ''};
    component_separators = {'|', '|'};
  }
}

-- =============== GUIDES =======================

-- Config: indent-blankline
-- vim.g.indent_blankline_use_treesitter = true
-- vim.g.indent_blankline_filetype = {
--   'lua',
--   'javascript',
--   'javascriptreact',
--   'typescript',
--   'typescriptreact',
--   'lua',
--   'json',
--   'yaml',
--   'html',
--   'swift',
--   'c',
--   'python',
--   'dockerfile',
--   'haskell',
-- }

-- require('indent_blankline')

-- =============== COLORSCHEMES ================

-- Config: moonfly
-- vim.g.moonflyTransparent = 1

-- Config tokyonight
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = false
vim.g.tokyonight_italic_functions = false
vim.cmd[[ colorscheme tokyonight ]]

-- Config nightfox
-- local nightfox = require('nightfox')
-- nightfox.load()
-- nightfox.setup({
--   fox = "nightfox", -- Which fox style should be applied
--   transparent = false, -- Disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening :terminal
--   styles = {
--     comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
--     functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
--     keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
--     strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
--     variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
--   },
-- })

-- =============== TROUBLE ================

require('todo-comments').setup({
  keywords = {
    FIX = {
      color = 'error', -- can be a hex color, or a named color (see below)
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug' }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { color = 'info' },
    HACK = { color = 'warning' },
    WARN = { color = 'warning', alt = { 'WARNING', 'XXX' } },
    PERF = { alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    NOTE = { color = 'hint', alt = { 'INFO' } },
  },
  colors = {
    error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
    warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
    info = { 'DiagnosticInformation', '#2563EB' },
    hint = { 'DiagnosticHint', '#10B981' },
    default = { 'Identifier', '#7C3AED' },
  },
})
