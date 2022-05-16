require("gitsigns").setup({
  keymaps = {},
  preview_config = { border = border },
  status_formatter = function(status)
    return " "
      .. (status.head == "" and "detached HEAD" or status.head)
      .. (status.added and status.added > 0 and "  " .. status.added or "")
      .. (status.changed and status.changed > 0 and "  " .. status.changed or "")
      .. (
        status.removed
          and status.removed > 0
          and "  " .. status.removed
        or ""
      )
  end,
})
