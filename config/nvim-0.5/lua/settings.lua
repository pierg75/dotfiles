local utils = require('utils')

local cmd = vim.cmd
local indent = 4

-- cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'syntax','enable')
utils.opt('o', 'showmatch', true)
utils.opt('w', 'colorcolumn','80')
utils.opt('o', 'lazyredraw', true)
utils.opt('o', 'termguicolors', true)

-- Tabs
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'smartindent', true)

utils.opt('o', 'shortmess', 'c')                -- don't show completion messages

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
