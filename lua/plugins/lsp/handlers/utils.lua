local M = {}

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

M.setup_completion = function(client, bufnr)
  if client.server_capabilities.completionProvider then
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
    })
  end
end

M.on_attach = function(client, bufnr)
  M.setup_completion(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, {
      bufnr = bufnr,
    })
  end

  -- Highlight references of symbol under cursor.
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group,
      buffer = bufnr,
      callback = function()
        pcall(vim.lsp.buf.document_highlight)
      end,
      desc = "LSP: highlight references under cursor",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group,
      buffer = bufnr,
      callback = function()
        pcall(vim.lsp.buf.clear_references)
      end,
      desc = "LSP: clear reference highlights",
    })
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
