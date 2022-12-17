-- Plugin Dependent User Commands

-- Load Snippets (requires luasnip)
vim.api.nvim_create_user_command(
  'Snippets',
  'lua require("luasnip.loaders.from_snipmate").load()',
  {}
)
