-- nvim-treesitter `main` branch (Nvim 0.12+ rewrite). Provides parser binaries
-- and queries only -- highlighting/folds/indents are activated by Neovim's
-- built-in treesitter integration. See `lua/config/globals.lua` for the
-- generic FileType autocmd that calls `vim.treesitter.start`.
--
-- To add a new language: run `:TSInstall <lang>` -- queries are included.
-- Other useful commands: `:TSUpdate`, `:TSUninstall <lang>`, `:TSLog`,
-- `:checkhealth nvim-treesitter`.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gotmpl",
        "python",
        "rust",
        "json",
        "yaml",
        "javascript",
        "typescript",
        "html",
        "css",
        "bash",
        "toml",
        "dockerfile",
        "http",
        "luadoc",
        "gitcommit",
        "diff",
      })
    end,
  },
}
