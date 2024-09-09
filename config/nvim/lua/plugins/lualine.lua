local M = {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}


function M.config()
	require("lualine").setup({
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "tokyonight-night",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      always_divide_middle = true,
    },
	})
end

return M
