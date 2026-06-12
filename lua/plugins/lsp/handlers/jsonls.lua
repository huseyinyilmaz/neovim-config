local lspconfig = require("lspconfig")
local utils = require("plugins.lsp.handlers.utils")

local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,

  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

return function()
  lspconfig.jsonls.setup(opts)
end
