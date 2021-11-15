local nvim_lsp = require('lspconfig')
local map = require('utils').map
local fn = vim.fn

local on_attach = function(client, bufnr)
  local borderStyle = "single"

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = borderStyle })

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = borderStyle })

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
  map('n', '<space>e',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "' .. borderStyle .. '" })<CR>')
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

-- note: this requires CMAKE and a compile_commands.json file:
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd 
nvim_lsp.clangd.setup{
  on_attach = on_attach;
}

nvim_lsp.tsserver.setup{
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true
      }
    ),
  };
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" };
}

nvim_lsp.diagnosticls.setup{
  on_attach = on_attach;
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {
          spacing = 4,
          prefix = '~',
        },
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = function(bufnr, client_id)
          local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
          -- No buffer local variable set, so just enable by default
          if not ok then
            return true
          end

          return result
        end,
        -- Disable a feature
        update_in_insert = false,
      }
    ),
  };
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" };
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint",
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = {
          ".eslintrc",
          ".eslintrc.json",
          ".eslintrc.cjs",
          ".eslintrc.js",
          ".eslintrc.yml",
          ".eslintrc.yaml",
          "package.json"
        },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        };
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
}
