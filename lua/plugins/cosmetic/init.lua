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
    [[ ⣿⣿⣷⡁⢆⠈⠕⢕⢂⢕⢂⢕⢂⢔⢂⢕⢄⠂⣂⠂⠆⢂⢕⢂⢕⢂⢕⢂⢕⢂ ]],
    [[ ⣿⣿⣿⡷⠊⡢⡹⣦⡑⢂⢕⢂⢕⢂⢕⢂⠕⠔⠌⠝⠛⠶⠶⢶⣦⣄⢂⢕⢂⢕ ]],
    [[ ⣿⣿⠏⣠⣾⣦⡐⢌⢿⣷⣦⣅⡑⠕⠡⠐⢿⠿⣛⠟⠛⠛⠛⠛⠡⢷⡈⢂⢕⢂ ]],
    [[ ⠟⣡⣾⣿⣿⣿⣿⣦⣑⠝⢿⣿⣿⣿⣿⣿⡵⢁⣤⣶⣶⣿⢿⢿⢿⡟⢻⣤⢑⢂ ]],
    [[ ⣾⣿⣿⡿⢟⣛⣻⣿⣿⣿⣦⣬⣙⣻⣿⣿⣷⣿⣿⢟⢝⢕⢕⢕⢕⢽⣿⣿⣷⣔ ]],
    [[ ⣿⣿⠵⠚⠉⢀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢕⢕⢕⢕⢕⢕⣽⣿⣿⣿⣿ ]],
    [[ ⢷⣂⣠⣴⣾⡿⡿⡻⡻⣿⣿⣴⣿⣿⣿⣿⣿⣿⣷⣵⣵⣵⣷⣿⣿⣿⣿⣿⣿⡿ ]],
    [[ ⢌⠻⣿⡿⡫⡪⡪⡪⡪⣺⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃ ]],
    [[ ⠣⡁⠹⡪⡪⡪⡪⣪⣾⣿⣿⣿⣿⠋⠐⢉⢍⢄⢌⠻⣿⣿⣿⣿⣿⣿⣿⣿⠏⠈ ]],
    [[ ⡣⡘⢄⠙⣾⣾⣾⣿⣿⣿⣿⣿⣿⡀⢐⢕⢕⢕⢕⢕⡘⣿⣿⣿⣿⣿⣿⠏⠠⠈ ]],
    [[ ⠌⢊⢂⢣⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⢐⢕⢕⢕⢕⢕⢅⣿⣿⣿⣿⡿⢋⢜⠠⠈ ]],
    [[ ⠄⠁⠕⢝⡢⠈⠻⣿⣿⣿⣿⣿⣿⣿⣷⣕⣑⣑⣑⣵⣿⣿⣿⡿⢋⢔⢕⣿⠠⠈ ]],
    [[ ⠨⡂⡀⢑⢕⡅⠂⠄⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⢔⢕⢕⣿⣿⠠⠈ ]],
    [[ ⠄⠪⣂⠁⢕⠆⠄⠂⠄⠁⡀⠂⡀⠄⢈⠉⢍⢛⢛⢛⢋⢔⢕⢕⢕⣽⣿⣿⠠⠈ ]],
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
    theme = 'catppuccin';
    icons_enabled = true;
    section_separators = {'', ''};
    component_separators = {'|', '|'};
  }
}

-- =============== GUIDES =======================

-- Config: indent-blankline
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype = {
  'lua',
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'html',
  'nix',
  'rust',
  'svelte',
  'css',
  'scss',
  'c',
  'python',
}

require('indent_blankline').setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

-- =============== COLORSCHEMES ================

-- Config: moonfly
-- vim.g.moonflyTransparent = 1

-- Config: catppuccin
local catppuccin = require('catppuccin')

vim.g.catppuccin_flavour = 'mocha'

catppuccin.setup({
  transparent_background = true,
  integrations = {
    telescope = true,
    gitsigns = true,
    cmp = true,
    treesitter = true,
  },
})

vim.api.nvim_command "colorscheme catppuccin"

-- Config tokyonight
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = false
-- vim.g.tokyonight_italic_functions = false
-- vim.cmd[[ colorscheme tokyonight ]]

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
