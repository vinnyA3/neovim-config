require('vin.set')
require('vin.remap')
require('vin.commands')
require('vin.packer')

-- Disable Default BuiltIn Plugins
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
