local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local yaml_companion_ok, yamlcomp = pcall(require, "yaml-companion")
if not yaml_companion_ok then
	return
end

local cfg = yamlcomp.setup({
  -- Add any options here, or leave empty to use the default settings
  -- lspconfig = {
  --   cmd = {"yaml-language-server"}
  -- },
})

lspconfig.yamlls.setup(cfg)
lspconfig["yamlls"].setup(cfg)
