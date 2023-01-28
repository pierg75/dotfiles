local utils = require('utils')

-- live grep using Telescope inside the current directory under
-- the cursor (or the parent directory of the current file)
local function grep_in(node)
  if not node then
    return
  end
  local path = node.absolute_path or uv.cwd()
  if node.type ~= 'directory' and node.parent then
    path = node.parent.absolute_path
  end
  require('telescope.builtin').live_grep({
    search_dirs = { path },
    prompt_title = string.format('Grep in [%s]', vim.fs.basename(path)),
  })
end

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  auto_reload_on_write  = true,
  sort_by               = "case_sensitive",
  disable_netrw         = true,
  hijack_netrw          = true,
  open_on_setup         = false,
  ignore_ft_on_setup    = {},
  open_on_tab           = false,
  hijack_cursor         = false,
  update_cwd            = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    adaptive_size = true,
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        { key = {"<Leader>gr", "gr" }, action = '', cb = grep_in, mode = "n"}}
    }
  }
}


-- nvim-tree shortcuts
utils.map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
utils.map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
utils.map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
