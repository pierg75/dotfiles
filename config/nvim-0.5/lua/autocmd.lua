local keymap = vim.keymap.set
local augroup

augroup = vim.api.nvim_create_augroup('Help', {})
vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    pattern = 'help',
    callback = function()
        if vim.fn.has('nvim-0.9') == 1 then
            vim.treesitter.start()
        end
        -- For help files, make <Return> behave like <C-]> (jump to tag)
        keymap('n', '<Return>', '<c-]>', { buffer = true })
        keymap('n', 'q', '<cmd>quit<cr>', { buffer = true })
    end,
})

augroup = vim.api.nvim_create_augroup('Spelling', {})
vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    pattern = {
        'asciidoc',
        'c',
        'changes',
        'gitcommit',
        'go',
        'markdown',
        'python',
        'rust',
        'spec',
    },
    callback = function()
        vim.wo.spell=true
    end,
})

augroup = vim.api.nvim_create_augroup('Yank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150,
        })
    end,
})
