local utils = require("plugins.lsp.handlers.utils")

return function()
  vim.lsp.config("pyright", {
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "on",
        },
      },
    },
  })
end
