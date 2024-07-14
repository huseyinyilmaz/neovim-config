local normal_mode_mappings = {
  -- tabline shortcuts
  ["<S-l>"] = { "<cmd>BufferLineCycleNext<CR>", "Next Buffer" },
  ["<S-h>"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
  ["<A-l>"] = { "<cmd>BufferLineMoveNext<CR>", "Move Buffer to Left" },
  ["<A-h>"] = { "<cmd>BufferLineMovePrev<CR>", "Move Buffer to Right" },
  -- resize current tab
  ["<C-Up>"] = { ":resize +2<CR>", "Increase width of current buffer" },
  ["<C-Down>"] = { ":resize -2<CR>", "Decrease width of current buffer" },
  ["<C-Left>"] = { ":vertical resize -2<CR>", "Increase height of current buffer" },
  ["<C-Right>"] = { ":vertical resize +2<CR>", "Decrease height of current buffer" },


  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Type Info" },
  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show Signature Help" },


  g = {
    ["q"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Show All LSP Errors" },
    ["l"] = { '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<cr>', "Show Diagnostics" },
    ["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    ["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Decleration" },
    ["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
    ["r"] = { "<cmd>Telescope lsp_references theme=ivy<CR>", "Show LSP References" },

  },

  ["<leader>"] = {
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["H"] = { "<cmd>checkhealth<CR>", "Check Health" },

    ["E"] = {
      "<cmd>Telescope find_files theme=ivy<cr>",
      "Find files",
    },
    ["f"] = {
      "<cmd>Telescope file_browser theme=ivy<cr>",
      "File Browser",
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

    ["l"] = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      c = { "<cmd>TSContextToggle<cr>", "Toggle Context"},
      d = {
        "<cmd>Telescope diagnostics<cr>",
        "Document Diagnostics",
      },
      w = {
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        "Workspace Diagnostics",
      },
      f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
      i = { "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", "Toggle Inlay Hints" },
      I = { "<cmd>LspInfo<cr>", "LSP Info" },
      -- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
        "Prev Diagnostic",
      },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
      o = { "<cmd>SymbolsOutline<cr>", "Symbol Outline Sidebar" },
    },

    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      g = { "<cmd>Telescope grep_string<cr>", "Grep String" },
    },

  }
}


local virtual_mode_mappings = {
  -- Stay in indent mode
  ["<"] = { "<gv", "Increase Indentation" },
  [">"] = { ">gv", "Decrease Indentation" },
}


local setup = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  local which_key = require("which-key")
  which_key.setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  })

  local normal_mode_opts = {
    mode = "n",     -- NORMAL mode
    -- prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  local virtual_mode_opts = {
    mode = "v",     -- NORMAL mode
    -- prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }


  which_key.register(normal_mode_mappings, normal_mode_opts)
  which_key.register(virtual_mode_mappings, virtual_mode_opts)
end


return {
  "folke/which-key.nvim",
  config = setup,
}
