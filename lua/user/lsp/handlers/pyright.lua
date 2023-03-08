local lspconfig = require("lspconfig")
local utils = require("user.lsp.handlers.utils")

local	settings = {
    python = {
      analysis = {
        typeCheckingMode = "on"
      }
    }
	}

local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
  settings = settings,
}

return function()
  local handler_name = 'pyright'
  lspconfig[handler_name].setup(opts)
  print('Custom lsp initialization is complete: ' .. handler_name)
end
