-- nvim-treesitter is used ONLY as a parser installer in Neovim 0.12+.
-- Highlighting, indentation, and folding are handled by Neovim's built-in
-- treesitter integration. See globals.lua for the built-in treesitter settings.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          -- Languages with active LSP/tooling
          "go", "gomod", "gosum", "gowork", "gotmpl",
          "python",
          "rust",
          "json", "jsonc",
          "yaml",
          -- Web
          "javascript", "typescript", "html", "css",
          -- Shell
          "bash",
          -- Config/Data
          "toml", "dockerfile", "http",
          -- Neovim (luadoc is not bundled)
          "luadoc",
          -- Git
          "gitcommit", "diff",
        },
        -- FIXME: Neovim 0.12 bundles its own parsers for these languages.
        -- The nvim-treesitter plugin versions conflict with the bundled
        -- runtime queries and cause 'range' nil crashes. Skip them so
        -- Neovim uses its own matched parser+query set.
        ignore_install = { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "query" },

        -- Highlighting and indentation are built into Neovim 0.12 -- disable here.
        highlight = { enable = false },
        indent = { enable = false },

        -- Incremental selection: expand/shrink by treesitter node
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },

        -- Textobjects: function, conditional, loop selections
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
        },

        -- Refactor: highlight definitions under cursor
        refactor = {
          highlight_definitions = { enable = true },
        },
      }
    end,
  },
}
