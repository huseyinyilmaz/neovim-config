local lspconfig = require("lspconfig")
local utils = require("user.lsp.handlers.utils")

local	settings = {
	}

local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
  settings = settings,
}

return function()
  local handler_name = "gopls"
  lspconfig[handler_name].setup(opts)
  print("Custom lsp initialization is complete: " .. handler_name)
end
