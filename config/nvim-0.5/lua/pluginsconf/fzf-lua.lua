local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- calling `setup` is optional for customization
}

function M.config()
  require("fzf-lua").setup({ 'skim' })
end

return M
