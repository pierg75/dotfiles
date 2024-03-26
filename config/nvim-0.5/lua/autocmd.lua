local keymap = vim.keymap.set

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('Help', { clear = True }),
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

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup('json-conceal', { clear = true }),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup('wrap-spell', { clear = true }),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
