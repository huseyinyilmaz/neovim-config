
local setup_mason_lspconfig = function()
  -- local mason = require("mason")
  require("lspconfig") -- Require lspconfig here
  local mason_lspconfig = require("mason-lspconfig")
  local handlers = require("plugins.lsp.handlers")

  mason_lspconfig.setup({
    ensure_installed = {gopls, pyright, jsonls, black},
    handlers = {
      handlers.default,
      pyright = handlers.pyright,
      jsonls = handlers.jsonls,
      lua_ls = handlers.lua_ls,
      gopls = handlers.gopls,
      },
  })

end

return {
  {"neovim/nvim-lspconfig"},

  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = setup_mason_lspconfig,
  },
}
