require('nvim-treesitter.configs').setup {
 -- TODO: check upstream if this works
  -- ensure_installed = {"typescript", "javascript", "kotlin", "c", "css",
  -- "astro"},
  incremental_selection = {
      enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  textobjects = { enable = true },
}
