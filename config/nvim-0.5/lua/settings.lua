local utils = require('utils')

local cmd = vim.cmd
local indent = 4

-- cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('o', 'hidden', true)
utils.opt('o', 'modeline', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 8 )
utils.opt('o', 'sidescrolloff', 8 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildoptions', 'pum')
utils.opt('o', 'pumblend', 20)
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

-- Some servers have issues with backup files
utils.opt('o', 'backup', false)
utils.opt('o', 'writebackup', false)

-- Give more space for displaying messages.
utils.opt('o', 'cmdheight', 2)

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
utils.opt('o', 'updatetime', 250)

-- Enable permanent undo
utils.opt('o', 'undofile', true)

-- Highlight the current line
utils.opt('o', 'cursorline', true)
utils.opt('o', 'cursorlineopt', 'both')


-- Highlight on yank
vim.api.nvim_create_autocmd(
    { "TextYankPost" },
    { pattern = { "*" },
    callback = function()
       vim.highlight.on_yank {on_visual = true}
    end
    }
)

-- Custom file type settings (like 2 spaces/tab for lua)
vim.api.nvim_create_autocmd(
    { "FileType" },
    { pattern = { "lua" }, command = "set tabstop=2 shiftwidth=2" }
)
vim.api.nvim_create_autocmd(
    { "FileType" },
    { pattern = { "yaml" }, command = "set tabstop=2 shiftwidth=2" }
)
