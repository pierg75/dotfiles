-- Custom function to map keymaps
--
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Access the internal file browser
map("n", "<leader>pv", vim.cmd.Ex)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window -2" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window +2" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize vertical window -2" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize vertical window +2" })

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Go to the next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Go to the previous buffer" })

-- Execute
map("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Clear highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

-- Close buffers
map("n", "<S-q>", "<cmd>Bdelete!<CR>")

-- Plugins --

-- fzf-lua
map("n", "<leader>fa", "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>")
map("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")
map("n", "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>")
map("n", "<leader>fl", "<cmd>lua require('fzf-lua').live_grep({ multiprocess=true })<CR>")
map("n", "<leader>ft", "<cmd>lua require('fzf-lua').grep({ multiprocess=true })<CR>")
map("n", "<leader>fT", "<cmd>lua require('fzf-lua').tags()<CR>")
map("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>")
map("n", "<header>flr", "<cmd>lua require('fzf-lua').lsp_references()<CR>")
map("n", "<leader>fld", "<cmd>lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<CR>")

-- LSP
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Show function declaration" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Show function definition" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show symbol information" })
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show references" })
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open the diagnostic window" })
map("n", "<Leader>li", "<cmd>LspInfo<cr>", { desc = "Show LSP information" })
map("n", "<Leader>lI", "<cmd>Mason<cr>", { desc = "Open Mason window" })
map("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Show code action" })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev<CR>", { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next<CR>", { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Open diagnostic [Q]uickfix list" })
map("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
map("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

-- Trouble
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" })
map(
	"n",
	"<leader>xd",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Open trouble document diagnostics" }
)
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Open trouble quickfix list" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
map(
	"n",
	"<leader>xt",
	"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
	{ desc = "LSP Definitions / references / ..." }
)
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols" })

-- Conform
map("n", "<leader>f", "<cmd>lua require('conform').format({ async = false })<CR>", { desc = "Format buffer" })

-- Gitsigns
map("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line({ full = true })<CR>", { desc = "Blame line (full)" })
map("n", "<leader>hB", "<cmd>Git blame<CR>", { desc = "Blame file" })
