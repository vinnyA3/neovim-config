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
