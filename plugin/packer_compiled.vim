" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/vincent.aceto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/vincent.aceto/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/vincent.aceto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/vincent.aceto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/vincent.aceto/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  firenvim = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["swift.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/opt/swift.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-markdown-composer"] = {
    commands = { "ComposerStart", "ComposerOpen" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/opt/vim-markdown-composer"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-prettier"] = {
    commands = { "Prettier", "PrettierAsync" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/opt/vim-prettier"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/vincent.aceto/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  }
}

time("Defining packer_plugins", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file ComposerOpen lua require("packer.load")({'vim-markdown-composer'}, { cmd = "ComposerOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file PrettierAsync lua require("packer.load")({'vim-prettier'}, { cmd = "PrettierAsync", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Prettier lua require("packer.load")({'vim-prettier'}, { cmd = "Prettier", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file ComposerStart lua require("packer.load")({'vim-markdown-composer'}, { cmd = "ComposerStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType swift ++once lua require("packer.load")({'swift.vim'}, { ft = "swift" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown-composer'}, { ft = "markdown" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /Users/vincent.aceto/.local/share/nvim/site/pack/packer/opt/swift.vim/ftdetect/swift.vim", true)
vim.cmd [[source /Users/vincent.aceto/.local/share/nvim/site/pack/packer/opt/swift.vim/ftdetect/swift.vim]]
time("Sourcing ftdetect script at: /Users/vincent.aceto/.local/share/nvim/site/pack/packer/opt/swift.vim/ftdetect/swift.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
