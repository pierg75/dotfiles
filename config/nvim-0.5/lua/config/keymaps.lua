local status_ok, utils = pcall(require, "utils")
if not status_ok then
	return
end


--- Clear search highlighting with <leader> and c
utils.map('n', '<leader>c', ':nohl<CR>')

---- nvim-tree shortcuts
utils.map('n', '<C-n>', ':Neotree toggle<CR>', {noremap = true, silent = true})

---- Windows move
utils.map("n", "<C-h>", "<C-w>h")
utils.map("n", "<C-j>", "<C-w>j")
utils.map("n", "<C-k>", "<C-w>k")
utils.map("n", "<C-l>", "<C-w>l")

---- telescope mappings
-- builtin pickers
local builtin = require('telescope.builtin')
utils.map('n', '<leader><space>', builtin.buffers)
utils.map('n', '<leader>sf', builtin.find_files)
utils.map('n', '<leader>sb', builtin.current_buffer_fuzzy_find)
utils.map('n', '<leader>sh', builtin.help_tags)
utils.map('n', '<leader>st', builtin.tags)
utils.map('n', '<leader>sd', builtin.grep_string)
utils.map('n', '<leader>sp', builtin.live_grep)
utils.map('n', '<leader>so', builtin.tags)
utils.map('n', '<leader>ss', builtin.spell_suggest)
utils.map('n', '<leader>sR', builtin.lsp_references)
utils.map('n', '<leader>sD', builtin.lsp_definitions)
utils.map('n', '<leader>sgc', builtin.git_commits)
utils.map('n', '<leader>sgb', builtin.git_branches)
utils.map('n', '<leader>?',  builtin.oldfiles)
-- lsp pickers
utils.map('n', '<leader>sfr',  builtin.lsp_references)
utils.map('n', '<leader>sfd',  builtin.lsp_definitions)
-- custom
utils.map('n', '<leader>con', [[<cmd>lua opts = {} opts[4] = "/home/plambri/.config/nvim" require('telescope.builtin').find_files(cwd)<CR>]])
-- live_grep_args
utils.map("n", "<leader>spa", require('telescope').extensions.live_grep_args.live_grep_args)

---- Fugitive
utils.map('n', '<Leader>gs', '<cmd>Git<CR>')

---- Trouble
utils.map("n", "<leader>xx", "<cmd>Trouble<cr>")
utils.map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
utils.map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
utils.map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
utils.map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
utils.map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- glance
utils.map('n', 'gD', '<CMD>Glance definitions<CR>')
utils.map('n', 'gR', '<CMD>Glance references<CR>')
utils.map('n', 'gY', '<CMD>Glance type_definitions<CR>')
utils.map('n', 'gM', '<CMD>Glance implementations<CR>')

