local map = require('utils').map

-- Config: lir 
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<CR>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)

      return {
        border = require("lir.float.helper").make_border_opts({
          "+", "─", "+", "│", "+", "─", "+", "│",
        }, "Normal"),
        width = width,
        height = height,
        row = 1,
        col = math.floor((vim.o.columns - width) / 2),
      }
    end
  },
  hide_cursor = true,
}

map('n', '<Leader>F', ":lua require'lir.float'.toggle()<CR>")
map('n', '-', [[<CMD>execute 'e ' .. expand('%:p:h')<CR>]]) -- netrw/dirvish file exp functionality

-- Config: lir-git-status
require'lir.git_status'.setup({ show_ignored = false })

-- Config: Telescope
local telescope_actions = require('telescope.actions')

-- helper :: fallback to 'find_files' if 'git_files' cannot find a .git directory
-- TODO: when doing future refactoring, modularize things and load custom
-- 'plugin' keybindings, so that we don't need to add this function to the
-- global scope
function gitFilesFallback()
  local opts = {} -- no opts for now
  local ok = pcall(require'telescope.builtin'.git_files, opts)

  if not ok then require'telescope.builtin'.find_files(opts) end
end

local default_mappings = {
  n = { -- n: signifies normal mode
    ['Q'] = telescope_actions.smart_add_to_qflist + telescope_actions.open_qflist,
    ['q'] = telescope_actions.smart_send_to_qflist + telescope_actions.open_qflist,
    ['<tab>'] = telescope_actions.toggle_selection + telescope_actions.move_selection_next,
    ['v'] = telescope_actions.file_vsplit,
    ['s'] = telescope_actions.file_split,
    ['<cr>'] = telescope_actions.file_edit,
  },
  i = { -- i: signifies normal mode
    ['<tab>'] = telescope_actions.toggle_selection + telescope_actions.move_selection_next,
  }
}

local opts_cursor = {
  initial_mode = 'normal',
  sorting_strategy = 'ascending',
  layout_strategy = 'cursor',
  results_title = false,
  layout_config = {
    width = 0.5,
    height = 0.4,
  },
}

local opts_vertical = {
  initial_mode = 'normal',
  sorting_strategy = 'ascending',
  layout_strategy = 'vertical',
  results_title = false,
  layout_config = {
    width = 0.3,
    height = 0.5,
    prompt_position = 'top',
    mirror = true,
  },
}

local telescope = require('telescope')

telescope.setup({
  defaults = {
    prompt_prefix = '🔍 ',
    selection_caret = '> ',
    file_ignore_patterns = {
      '.git/',
    },
    dynamic_preview_title = true,
    vimgrep_arguments = {
      'rg',
      '--ignore',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
  pickers = {
    buffers = {
      prompt_title = '✨ Search Buffers ✨',
      mappings = vim.tbl_deep_extend('force', {
        n = { -- n: signifies normal mode (control-d delete)
          ['<C-d>'] = telescope_actions.delete_buffer,
        },
      }, default_mappings),
      sort_mru = true,
      preview_title = false,
    },
    lsp_code_actions = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'Code Actions',
    }),
    lsp_range_code_actions = vim.tbl_deep_extend('force', opts_vertical, {
      prompt_title = 'Code Actions',
    }),
    lsp_document_diagnostics = vim.tbl_deep_extend('force', opts_vertical, {
      prompt_title = 'Document Diagnostics',
      mappings = default_mappings,
    }),
    lsp_implementations = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'Implementations',
      mappings = default_mappings,
    }),
    lsp_definitions = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'Definitions',
      mappings = default_mappings,
    }),
    lsp_references = vim.tbl_deep_extend('force', opts_cursor, {
      prompt_title = 'References',
      mappings = default_mappings,
    }),
    find_files = {
      prompt_title = '✨ Search Project ✨',
      mappings = default_mappings,
      hidden = true,
    },
    git_files = {
      prompt_title = '✨ Search Git Project ✨',
      mappings = default_mappings,
      hidden = true,
    },
    oldfiles = {
      prompt_title = '✨ Search History ✨',
      mappings = default_mappings,
      hidden = true,
    },
    live_grep = {
      prompt_title = '✨ Live Grep ✨',
      mappings = default_mappings,
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('harpoon') -- load harpoon

map('n', '<C-p>', '<cmd>lua gitFilesFallback()<cr>')
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fh', ':Telescope oldfiles<cr>')
map('n', '<leader>fa', ':Telescope live_grep<cr>')
map('n', '<leader>b', ':Telescope buffers<cr>')
map('n', '<leader>gcc', ':Telescope git_commits<cr>')
map('n', '<leader>gst', ':Telescope git_status<cr>')
map('n', '<C-b>', ':Telescope git_branches<cr>')

-- Config: harpoon
map("n", "<leader>ha", ":lua require'harpoon.mark'.add_file()<CR>")
map("n", "<leader>ha", ":Telescope harpoon marks<CR>") -- telescope ext
