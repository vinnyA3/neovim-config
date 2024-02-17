-- run :make to run typescript compiler on all project files & pipe errors to QL
local augroup = vim.api.nvim_create_augroup("strdr4605", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript,typescriptreact",
  group = augroup,
  command = "compiler tsc | setlocal makeprg=npx\\ tsc",
})

-- Plugin Dependent User Commands
-- Load Snippets (requires luasnip)
vim.api.nvim_create_user_command(
  'Snippets',
  'lua require("luasnip.loaders.from_snipmate").load()',
  {}
)

