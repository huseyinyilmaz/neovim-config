local utils = require("plugins.lsp.handlers.utils")

return function()
  vim.lsp.config("jsonls", {
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })
end
