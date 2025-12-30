local lspconfig = require("lspconfig")
local utils = require("plugins.lsp.handlers.utils")

local	settings = {
  usePlaceholders = true,
  completeUnimported = true,
  analyses = {
    unusedparams = true,
    shadow = true,
	}
}


local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
  settings = settings,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
}

return function()
  local handler_name = "gopls"
  lspconfig[handler_name].setup(opts)
  print("Custom lsp initialization is complete: " .. handler_name)
end
