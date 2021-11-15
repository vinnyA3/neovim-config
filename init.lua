local set_keymap = vim.api.nvim_set_keymap

-- setup leader key first and foremost
set_keymap('n', '<Space>', '', {})
set_keymap('v', '<Space>', '', {})

vim.g.mapleader = " "

require('core/options')
require('core/keybindings')
require('core/disabled') -- disabled vim default plugings

require('plugins/init') -- packer init plugins
require('plugins/config') -- source file to include local plugin config

require('lsp/init')
