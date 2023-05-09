local M = {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
  },
}

return M
