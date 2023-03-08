local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local handlers = require("user.lsp.handlers")

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
  handlers.default,
  pyright = handlers.pyright,
  jsonls = handlers.jsonls,
  lua_ls = handlers.lua_ls,
  gopls = handlers.gopls,
})

handlers.utils.setup()
