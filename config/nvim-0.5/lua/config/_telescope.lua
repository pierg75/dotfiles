local default = {
   defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "bottom",
            preview_width = 0.5,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
}

require('telescope').setup(default)

-- builtin pickers
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><space>', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>st', builtin.tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sd', builtin.grep_string, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sp', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>so', builtin.tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sR', builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sD', builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sgb', builtin.git_branches, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>?',  builtin.oldfiles, { noremap = true, silent = true })
-- lsp pickers
vim.keymap.set('n', '<leader>sfr',  builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sfd',  builtin.lsp_definitions, { noremap = true, silent = true })
-- custom
vim.keymap.set('n', '<leader>con', [[<cmd>lua opts = {} opts[4] = "/home/plambri/.config/nvim" require('telescope.builtin').find_files(cwd)<CR>]], { noremap = true, silent = true })
