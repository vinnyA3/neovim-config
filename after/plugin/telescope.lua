local telescope = require('telescope')
local telescope_actions = require('telescope.actions')
local telescope_themes = require('telescope.themes')
local telescope_builtin = require('telescope.builtin')

local map = require('vin.utils').map

telescope.load_extension('fzf')

-- helper :: fallback to 'find_files' if 'git_files' cannot find a .git directory
-- TODO: when doing future refactoring, modularize things and load custom
-- 'plugin' keybindings, so that we don't need to add this function to the
-- global scope
function gitFilesFallback()
  -- local opts = {} -- no opts for now
  -- local ok = pcall(telescope_builtin.git_files, opts)
  --
  -- if not ok then
  --   telescope_builtin.find_files(telescope_themes.get_ivy())
  -- end
  
  -- NOTE: this is a worked for broken check above (in comment) .. this might be
  -- a future config object, or actually fixed upstream .. just check on last
  -- release: see https://github.com/nvim-telescope/telescope.nvim/issues/2183
  local in_git_repo = vim.fn.systemlist"git rev-parse --is-inside-work-tree"[1] == 'true'

  if in_git_repo then
    telescope_builtin.git_files()
  else
    telescope_builtin.find_files()
  end
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
      prompt_title = '🔎 Search Project',
      mappings = default_mappings,
      hidden = true,
    },
    git_files = {
      prompt_title = '📚 Search Git Project',
      mappings = default_mappings,
      hidden = true,
    },
    oldfiles = {
      prompt_title = '📒 Search History',
      mappings = default_mappings,
      hidden = true,
    },
    live_grep = {
      prompt_title = '🔍 Live Grep',
      mappings = default_mappings,
      hidden = true,
    },
    commands = {
      prompt_title = '📢 Commands',
      theme = "dropdown",
      hidden = false,
    }
  },
})

-- === Mappings ===
map('n', '<C-p>', '<cmd>lua gitFilesFallback()<cr>')
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fh', ':Telescope oldfiles<cr>')
map('n', '<leader>fa', ':Telescope live_grep<cr>')
map('n', '<leader>b', ':Telescope buffers<cr>')
map('n', '<leader>gcc', ':Telescope git_commits<cr>')
map('n', '<leader>gst', ':Telescope git_status<cr>')
map('n', '<C-b>', ':Telescope git_branches<cr>')
map('n', '<Leader><tab>', ':Telescope commands<CR>')
