-- Map leader to space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('plugins')
require('lang')
require('config')
require('settings')

-- Always load twilight
-- vim.cmd 'TwilightEnable'

