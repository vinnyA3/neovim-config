local map = require('vin.utils').map

require('todo-comments').setup({
  keywords = {
    FIX = {
      color = 'error', -- can be a hex color, or a named color (see below)
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug' }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { color = 'info' },
    HACK = { color = 'warning' },
    WARN = { color = 'warning', alt = { 'WARNING', 'XXX' } },
    PERF = { alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    NOTE = { color = 'hint', alt = { 'INFO' } },
  },
  colors = {
    error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
    warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
    info = { 'DiagnosticInformation', '#2563EB' },
    hint = { 'DiagnosticHint', '#10B981' },
    default = { 'Identifier', '#7C3AED' },
  },
})

-- === Mappings ===
-- Config trouble.nvim
map("n", "<leader>xx", ":Trouble<cr>")
map("n", "<leader>xw", ":Trouble lsp_workspace_diagnostics<cr>")
map("n", "<leader>xd", ":Trouble lsp_document_diagnostics<cr>")
map("n", "<leader>xl", ":Trouble loclist<cr>")
map("n", "<leader>xq", ":Trouble quickfix<cr>")
map("n", "gR", ":Trouble lsp_references<cr>")
