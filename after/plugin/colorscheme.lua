-- Config: Tokyonight
-- require("tokyonight").setup({
--   style = "night",
--   transparent = true,
-- })

require('catppuccin').setup({
  flavour = "mocha",
  transparent_background = true,
  dim_inactive = {
    enabled = false,
  }
})

vim.cmd.colorscheme 'catppuccin'

-- vim.g.moonflyTransparent = true
-- vim.cmd[[ colorscheme moonfly ]]

-- Config: moonfly
-- vim.g.moonflyTransparent = 1
