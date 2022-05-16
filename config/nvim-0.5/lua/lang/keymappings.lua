local utils = require('utils')
utils.map('n', '<C-l>', '<cmd>noh<CR>')       -- Clear highlights
utils.map('i', 'jk', '<Esc>')                                               -- jk to escape

-- move around splits using Ctrl + {h,j,k,l}
utils.map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
utils.map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
utils.map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
utils.map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

