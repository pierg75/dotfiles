-- Map leader to space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Plugin loader (lazy)
require "options"
require "autocmd"
require "plugins"
require "keymaps"
require "ft"

vim.cmd 'colorscheme tokyonight'
