local cmp = require'cmp' -- nvim-cmp

-- Didn't really feel like installing another plug for icons
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  return col ~= 0 and vim.api.nvim_buf_get_lines(
    0,
    line - 1,
    line,
    true
  )[1]:sub(col, col):match("%s") == nil
end

local select_next_item = cmp.mapping(function(fallback)
  if cmp.visible() then cmp.select_next_item()
  elseif has_words_before() then cmp.complete()
  else fallback()
  end
end, { "i", "s"})

local select_prev_item = function()
  if cmp.visible() then cmp.select_prev_item()
  elseif has_words_before() then cmp.complete()
  else fallback()
  end
end

cmp.setup {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    {
      name = 'buffer',
      options = {
        get_bufnrs = function()
          local bufs = {}

          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end

          return vim.tbl_keys(bufs)
        end
      }
    },
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = select_next_item,
    ['<C-k>'] = select_prev_item,
    ["<Tab>"] = select_next_item,
    ["<S-Tab>"] = select_prev_item,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format(
        '%s %s',
        kind_icons[vim_item.kind], vim_item.kind
      )

      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
      })[entry.source.name]

      return vim_item
    end
  }
}
