local lspconfig = require("lspconfig")
local utils = require("plugins.lsp.handlers.utils")

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
  lspconfig.pyright.setup(opts)
end
