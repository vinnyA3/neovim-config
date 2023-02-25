-- Initialize defaults
require('vin.set')
require('vin.remap')
require('vin.commands')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}

-- LazyNvim setup
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Disable Default BuiltIn Plugins
for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

require("lazy").setup({
  spec = {
    import = "plugins"
  },
  ui = {
    border = "rounded"
  }
});
