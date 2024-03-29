-- Map leader to space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Plugin loader (lazy)
require "options"
require "keymaps"
require "autocmd"
require "plugins"

vim.cmd[[colorscheme tokyonight]]
