local m = {
  "mfussenegger/nvim-lint",
}

function m.config()
  require("lint").linters_by_ft = {
    python = { "ruff" },
    vim.api.nvim_create_autocmd({ "bufwritepost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  }
end

return m
