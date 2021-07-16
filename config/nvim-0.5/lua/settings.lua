local utils = require('utils')

local cmd = vim.cmd
local indent = 4

-- cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('o', 'hidden', true)
utils.opt('o', 'modeline', true)
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
utils.opt('o', 'incsearch', true)
utils.opt('o', 'shortmess', 'c')                -- don't show completion messages
utils.opt('o', 'inccommand', 'nosplit')         -- Incremental live completion
utils.opt('o', 'breakindent', true)             -- Enable break indent

-- Tabs
utils.opt('b', 'cindent', true)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'smartindent', true)

-- Spelling
utils.opt('o', 'spelllang', 'en,it')                -- don't show completion messages
-- utils.opt('o', 'spell', true)                -- don't show completion messages


-- Some servers have issues with backup files
utils.opt('o', 'backup', false)
utils.opt('o', 'writebackup', false)

-- Give more space for displaying messages.
utils.opt('o', 'cmdheight', 2)

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
utils.opt('o', 'updatetime', 300)

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Custom file type settings (like 2 spaces/tab for lua)
vim.api.nvim_exec([[
    autocmd FileType lua set tabstop=2 shiftwidth=2
    autocmd FileType yaml set tabstop=2 shiftwidth=2
]], false)
