local m = {
  default = require('plugins.lsp.handlers.default'),
  pyright = require('plugins.lsp.handlers.pyright'),
  jsonls = require('plugins.lsp.handlers.jsonls'),
  lua_ls = require('plugins.lsp.handlers.lua_ls'),
  gopls = require('plugins.lsp.handlers.gopls'),
  utils = require('plugins.lsp.handlers.utils'),
}

return m
