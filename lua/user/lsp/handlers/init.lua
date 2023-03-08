local m = {
  default = require('user.lsp.handlers.default'),
  pyright = require('user.lsp.handlers.pyright'),
  jsonls = require('user.lsp.handlers.jsonls'),
  lua_ls = require('user.lsp.handlers.lua_ls'),
  gopls = require('user.lsp.handlers.gopls'),
  utils = require('user.lsp.handlers.utils'),
}

return m
