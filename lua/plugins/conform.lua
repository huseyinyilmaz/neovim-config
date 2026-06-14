return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "goimports", "gofmt" },
    },
    format_on_save = { timeout_ms = 500 },
  },
}
