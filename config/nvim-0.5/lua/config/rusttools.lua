
local status_rust, rt = pcall(require, "rust-tools")
if not status_rust then
	return
end

local status_utils, utils = pcall(require, "utils")
if not status_utils then
	return
end

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      utils.map("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      utils.map("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
