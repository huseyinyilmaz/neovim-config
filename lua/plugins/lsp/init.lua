local setup_mason_lspconfig = function()
  require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")
  local handlers = require("plugins.lsp.handlers")

  mason_lspconfig.setup({
    ensure_installed = { "gopls", "pyright", "jsonls", "rust_analyzer", "lua_ls", "yamlls", "golangci_lint_ls" },
  })

  -- Configure LSP servers using the Neovim 0.11+ vim.lsp.config API.
  -- These run synchronously before automatic_enable's scheduled enable_all().
  handlers.lua_ls()
  handlers.pyright()
  handlers.gopls()
  handlers.jsonls()
end

return {
  { "neovim/nvim-lspconfig" },
  { "b0o/SchemaStore.nvim" },

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
