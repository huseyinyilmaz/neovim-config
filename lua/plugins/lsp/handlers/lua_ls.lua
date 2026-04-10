local lspconfig = require("lspconfig")
local utils = require("plugins.lsp.handlers.utils")

local settings = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
        vim.env.VIMRUNTIME .. "/lua",
        vim.fn.stdpath("config") .. "/lua",
      },
    },
  },
}

local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
  settings = settings,
}

return function()
  lspconfig.lua_ls.setup(opts)
end
