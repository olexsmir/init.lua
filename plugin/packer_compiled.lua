-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

time([[Luarocks path setup]], true)
local package_path_str = "/home/sasha/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/sasha/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/sasha/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/sasha/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sasha/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  LuaSnip = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\1\2Y\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fmapping\1\0\0\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/better-escape.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["cmp-tabnine"] = {
    after_files = { "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/after/plugin/cmp-tabnine.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp-tabnine"
  },
  cmp_luasnip = {
    after_files = { "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\1\2G\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\30plugin.configs.statusline\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2E\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\28plugin.configs.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\1\2E\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\ngofmt\fgofumpt\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  ["lua-dev.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\flua-dev\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\1\2H\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\31plugin.configs.lsp.null-ls\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "cmp-nvim-lua", "LuaSnip", "cmp-buffer", "cmp_luasnip", "cmp-path", "cmp-tabnine" },
    loaded = true,
    only_config = true
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "null-ls.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\1\2E\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\28plugin.configs.nvimtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2G\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\30plugin.configs.treesitter\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedarker.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/onedarker.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\1\2D\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\27plugin.configs.project\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\1\2F\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\29plugin.configs.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\2E\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\28plugin.configs.terminal\frequire\0" },
    keys = { { "", "<C-t>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim"
  },
  ["ts-unit.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/ts-unit.nvim"
  },
  ["vim-surround"] = {
    keys = { { "", "c" }, { "", "y" }, { "", "d" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-ultest"] = {
    commands = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    config = { "\27LJ\1\2C\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\26plugin.configs.ultest\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/opt/vim-ultest"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2G\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\30plugin.configs.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23plugin.configs.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\1\2Y\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fmapping\1\0\0\1\2\0\0\ajk\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2E\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\28plugin.configs.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2G\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\30plugin.configs.lsp.config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\1\2G\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\30plugin.configs.statusline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\1\2D\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\27plugin.configs.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd null-ls.nvim ]]

-- Config for: null-ls.nvim
try_loadstring("\27LJ\1\2H\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\31plugin.configs.lsp.null-ls\frequire\0", "config", "null-ls.nvim")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-tabnine ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd cmp-buffer ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestStop lua require("packer.load")({'vim-ultest'}, { cmd = "UltestStop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ultest lua require("packer.load")({'vim-ultest'}, { cmd = "Ultest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestNearest lua require("packer.load")({'vim-ultest'}, { cmd = "UltestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestOutput lua require("packer.load")({'vim-ultest'}, { cmd = "UltestOutput", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestClear lua require("packer.load")({'vim-ultest'}, { cmd = "UltestClear", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> d <cmd>lua require("packer.load")({'vim-surround'}, { keys = "d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-t> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-t>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> c <cmd>lua require("packer.load")({'vim-surround'}, { keys = "c", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> y <cmd>lua require("packer.load")({'vim-surround'}, { keys = "y", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lua-dev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
