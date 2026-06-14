local utils = require("plugins.lsp.handlers.utils")

return function()
  vim.lsp.config("lua_ls", {
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = {
            vim.fn.stdpath("config") .. "/lua",
            vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua",
          },
          checkThirdParty = false,
        },
      },
    },
  })
end
