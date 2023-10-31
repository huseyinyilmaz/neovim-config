local null_ls = require('null-ls')

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  debug = false,
  sources = {
    -- formatting.eslint,
    formatting.gofmt,
    -- formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
    -- Python
    formatting.black.with { extra_args = { "--fast" } },
    formatting.isort,
    diagnostics.flake8,
    -- formatting.yapf,
    -- There is another formatter provided by sumneko_lua lsp backend.
    -- formatting.stylua,
    -- js, jsx, ts, tsx
    formatting.prettier,
    -- formatting.prettierd,
    code_actions.shellcheck,
    -- Instead of using this from null-ls use bash-lsp which uses shellcheck for errors.
    -- null_ls.builtins.diagnostics.shellcheck,
    formatting.shellharden,
  },
}
