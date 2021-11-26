-- Config: cmp
local cmp = require 'cmp'

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

cmp.setup {
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
    }
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
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
