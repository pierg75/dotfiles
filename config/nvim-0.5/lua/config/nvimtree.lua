local utils = require('utils')

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
      list = {}
    }
  }
}

-- nvim-tree shortcuts
utils.map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
utils.map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
utils.map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
