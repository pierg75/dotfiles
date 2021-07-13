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
local package_path_str = "/home/plambri/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/plambri/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/plambri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/plambri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/plambri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-snippets"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/python-snippets"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vscode-python-snippet-pack"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/vscode-python-snippet-pack"
  },
  ["vscode-rust"] = {
    loaded = true,
    path = "/home/plambri/.local/share/nvim/site/pack/packer/start/vscode-rust"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
