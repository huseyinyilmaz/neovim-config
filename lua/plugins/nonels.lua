local setup_null_ls = function()
  local null_ls = require("null-ls")

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  -- local diagnostics = null_ls.builtins.diagnostics
  -- local code_actions = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      -- go-lang
      formatting.gofmt,
      formatting.goimports,
      -- python
      formatting.black.with({ extra_args = { "--fast" } }),
      formatting.isort,
      -- lua
      formatting.stylua,
    },
  })
end

return {
  "nvimtools/none-ls.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  event = { "BufReadPre", "BufNewFile" },
  config = setup_null_ls,
}
