-- Config: Tokyonight
require("tokyonight").setup({
  style = "night",
  transparent = true,
})

vim.cmd[[ colorscheme tokyonight ]]

-- Config: moonfly
-- vim.g.moonflyTransparent = 1

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
