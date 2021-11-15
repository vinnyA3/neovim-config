-- Plugin Initialization

require('impatient')

local plugin_modules = {
  'plugins.cosmetic',
  'plugins.navigation',
  'plugins.editing',
  'plugins.autocompletion',
}

for _, mod in pairs(plugin_modules) do
  local ok, err = pcall(require, mod)
  
  if not ok then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end
end
