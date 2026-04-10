local M = {}

-- TODO: backfill this to template
M.setup = function()
  -- In Neovim 0.12+, use vim.diagnostic.config for signs instead of vim.fn.sign_define
  vim.diagnostic.config({
    -- disable virtual text
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
  })
end

M.on_attach = function(client, bufnr)
  -- Use the modern server_capabilities field name
  if client.name == "tsserver" or client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, {
          bufnr = bufnr,
      })
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
