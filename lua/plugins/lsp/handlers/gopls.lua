local utils = require("plugins.lsp.handlers.utils")

return function()
  vim.lsp.config("gopls", {
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = {
      gopls = {
        usePlaceholders = true,
        completeUnimported = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
      },
    },
  })
end
