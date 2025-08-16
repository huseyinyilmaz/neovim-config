local setup_null_ls = function()
  local null_ls = require('null-ls')

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  local code_actions = null_ls.builtins.code_actions

  null_ls.setup {
    debug = true,

    sources = {
      -- ts / js
      -- formatting.prettier,
      -- diagnostics.eslint,
      -- code_actions.eslint,
      -- css scss sass
      -- diagnostics.stylelint,
      -- formatting.stylelint,
      -- Bash
      -- code_actions.shellcheck,
      -- Instead of using this from null-ls use bash-lsp which uses shellcheck for errors.
      -- null_ls.builtins.diagnostics.shellcheck,
      -- formatting.shellharden,
      -- go-lang
      -- formatting.gofmt,
      --
      -- python
      formatting.black.with { extra_args = { "--fast" } },
      formatting.isort,
      --
      -- lua
      formatting.stylua,
    }
  }
end


return {
    "nvimtools/none-ls.nvim",
    after = "nvim-lspconfig",
    config = setup_null_ls,
}
