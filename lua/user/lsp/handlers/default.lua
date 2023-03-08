local lspconfig = require("lspconfig")
local utils = require("user.lsp.handlers.utils")

local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
}

return function(handler_name)
  lspconfig[handler_name].setup(opts)
  utils.setup()
  print('Default lsp initialization is complete: ' .. handler_name)
end
