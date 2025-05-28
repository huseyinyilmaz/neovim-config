local setup_null_ls = function()
  local null_ls = require('null-ls')

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  local code_actions = null_ls.builtins.code_actions

  null_ls.setup {
    debug = false,

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
      -- diagnostics.flake8,
      -- formatting.black.with { extra_args = { "--fast" } },
      -- formatting.isort,
      --
      -- lua
      -- formatting.stylua,
    }
  }
  
  -- null_ls.setup {
  --   debug = false,
  --   sources = {
  --     formatting.gofmt,
  --     -- formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
  --     --
  --     -- Python
  --     formatting.black.with { extra_args = { "--fast" } },
  --     formatting.isort,
  --     diagnostics.flake8,
  --     -- formatting.yapf,
  --     -- There is another formatter provided by sumneko_lua lsp backend.
  --     -- formatting.stylua,
  --     -- js, jsx, ts, tsx
  --     --
  --     -- Javascript and Typescript
  --     -- formatting.eslint,
  --     formatting.prettier,
  --     diagnostics.eslint,
  --     code_actions.eslint,
  --     --
  --     -- css scss sass
  --     diagnostics.stylelint,
  --     formatting.stylelint,
  --
  --     --
  --     -- Bash
  --     code_actions.shellcheck,
  --     -- Instead of using this from null-ls use bash-lsp which uses shellcheck for errors.
  --     -- null_ls.builtins.diagnostics.shellcheck,
  --     formatting.shellharden,
  --   },
  -- }

end


local setup_mason_lspconfig = function()
  -- local mason = require("mason")
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
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = setup_null_ls,
    },
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
    event = "VeryLazy",
  }
}
