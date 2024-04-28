-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


keymap("", "<leader><leader>ps", "<Cmd>Lazy sync<CR>", { desc = "update vim plugins" })

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts, { desc = "Switch window left" })
keymap("n", "<C-j>", "<C-w>j", opts, { desc = "Switch window down" })
keymap("n", "<C-k>", "<C-w>k", opts, { desc = "Switch window up" })
keymap("n", "<C-l>", "<C-w>l", opts, { desc = "Switch window right" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts, { desc = "Resize window -2" })
keymap("n", "<C-Down>", ":resize +2<CR>", opts, { desc = "Resize window +2" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts, { desc = "Resize vertical window -2" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts, { desc = "Resize vertical window +2" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts, { desc = "Go to the next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", opts, { desc = "Go to the previous buffer" })

-- Clear highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts, { desc = "Clear highlights" })

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- fzf-lua
keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", opts)
keymap("n", "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>", opts)
keymap("n", "<leader>fl", "<cmd>lua require('fzf-lua').live_grep({ multiprocess=true })<CR>", opts)
keymap("n", "<leader>ft", "<cmd>lua require('fzf-lua').grep({ multiprocess=true })<CR>", opts)
keymap("n", "<leader>fT", "<cmd>lua require('fzf-lua').tags()<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
keymap("n", "<leader>flr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", opts)
keymap("n", "<leader>fld", "<cmd>lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- kepmap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Twlight toggle
keymap("n", "<leader>t", ":Twilight <CR>", opts)
