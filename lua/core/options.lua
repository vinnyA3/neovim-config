local fn = vim.fn
local opt = vim.opt
local cmd = vim.cmd
local indent = 2

-- command options
cmd(
  [[ autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete ]],
  false
)
cmd('set shortmess+=c') -- avoid showing extra message when using completion
cmd('set path+=**')

-- italic escapes
cmd([[
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
]])

-- misc
opt.syntax = 'enable'
opt.hidden = true
opt.encoding = 'utf-8'
opt.clipboard = 'unnamedplus'
opt.backspace = { 'eol', 'start', 'indent' }
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.showbreak = string.rep("↳ ", 2) -- so long lines smartly wrap
opt.linebreak = true
opt.textwidth = 80

-- define how cmdline-completion works
-- opt.pumblend = 5
-- opt.wildmode = 'longest:full'
-- opt.wildoptions = 'pum'

-- indentation & tabs
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.cindent = true
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.expandtab = true
opt.wrap = true -- wrap lines

-- search
opt.wildmenu = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { '*/node_modules/*', '*/.git/*', '*/vendor/*' }
opt.hlsearch = false

-- ui
opt.number = true
opt.cursorline = false
opt.signcolumn = 'yes'
opt.laststatus = 2
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.list = true
opt.listchars = {
  tab = '❘-',
  trail = '·',
  lead = '·',
  extends = '»',
  precedes = '«',
  nbsp = '×',
}
opt.showmode = false
opt.lazyredraw = true
opt.mouse = 'a'
opt.splitright = true -- Open new split to the right
opt.splitbelow = true -- Open new split below

-- backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.viewdir = fn.stdpath('config')..'/views'

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess = opt.shortmess + { c = true }

-- perfomance
opt.updatetime = 100
opt.timeoutlen = 400
opt.redrawtime = 1500
opt.ttimeoutlen = 10

-- theme
opt.termguicolors = true
