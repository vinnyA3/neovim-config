local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')
local map = require('vin.utils').map
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client)
  local borderStyle = "rounded"

  vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = borderStyle })

  vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = borderStyle })

  vim.diagnostic.config({
    float = {
      source = 'always',
      border = borderStyle
    }
  })

  -- control lsp formatting - (use none-ls for formatting)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>') -- requires telescope
  map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  map('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>')
end

-- =========== NULL/NONE-LS ============
local null_ls_sources = {
  null_ls.builtins.formatting.prettierd.with({
    filetypes = {
      "astro",
      "html",
      "json",
      "yaml",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    }
  }),
  null_ls.builtins.formatting.golines.with({
    filetypes = {
      "go"
    }
  }),
  null_ls.builtins.formatting.black.with({
    filetypes = {
      "python"
    }
  }),
}

null_ls.setup({
  sources = null_ls_sources,
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
})
-- =========== NULL/NONE-LS ============

-- ========= NVIM LSP CONFIGS ==========

-- note: this requires CMAKE and a compile_commands.json file:
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
nvim_lsp.clangd.setup { on_attach = on_attach }

-- note: rust-analyzer must be installed on your machine first
-- https://github.com/rust-lang/rust-analyzer
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" }
}

nvim_lsp.zls.setup {}

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true
      }
    ),
  },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

nvim_lsp.astro.setup {
  on_attach = on_attach,
}

nvim_lsp.eslint.setup {}

nvim_lsp.pylsp.setup {}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true
    }
  }
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
}

nvim_lsp.svelte.setup {
  on_attach = on_attach,
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" }
}

nvim_lsp.zk.setup {
  on_attach = on_attach,
}

nvim_lsp.marksman.setup {
  on_attach = on_attach,
}
-- ========= NVIM LSP CONFIGS ==========
