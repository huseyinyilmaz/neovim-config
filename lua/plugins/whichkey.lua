local normal_mode_mappings = {
  -- tabline shortcuts
  { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
  { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
  { "<A-l>", "<cmd>BufferLineMoveNext<CR>", desc = "Move Buffer to Left" },
  { "<A-h>", "<cmd>BufferLineMovePrev<CR>", desc = "Move Buffer to Right" },
  -- resize current tab
  { "<C-Up>", ":resize +2<CR>", desc = "Increase width of current buffer" },
  { "<C-Down>", ":resize -2<CR>", desc = "Decrease width of current buffer" },
  { "<C-Left>", ":vertical resize -2<CR>", desc = "Increase height of current buffer" },
  { "<C-Right>", ":vertical resize +2<CR>", desc = "Decrease height of current buffer" },

  { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show Type Info" },
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Show Signature Help" },

  { "g", group = "Go to..." },
  { "gnc", "<cmd>lua require('gitsigns').next_hunk()<CR>", desc = "Next Hunk" },
  { "gpc", "<cmd>lua require('gitsigns').prev_hunk()<CR>", desc = "Prev Hunk" },
  { "gq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Show All LSP Errors" },
  { "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<cr>', desc = "Show Diagnostics" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Decleration" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Show LSP References" },

  { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
  { "<leader>c", "<cmd>bdelete<CR>", desc = "Close Buffer" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>H", "<cmd>checkhealth<CR>", desc = "Check Health" },

  { "<leader>t", group = "Nvim Tree" },
  { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },
  { "<leader>tr", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh Tree" },
  { "<leader>ts", "<cmd>NvimTreeFindFile<cr>", desc = "Find File In Tree" },
  { "<leader>tc", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse Tree" },

  { "<leader>d", group = "Debugger" },
  {
    "<leader>dt",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
  },
  {
    "<leader>dT",
    function()
      require("dap.repl").toggle()
    end,
    desc = "Toggle REPL",
  },
  {
    "<leader>dr",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "Run To Cursor",
  },
  {
    "<leader>dR",
    function()
      require("dap").restart()
    end,
    desc = "Restart",
  },
  {
    "<leader>dQ",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
  },
  {
    "<leader>dn",
    function()
      require("dap").step_over()
    end,
    desc = "Next (Step Over)",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>dI",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "Pause",
  },
  {
    "<leader>du",
    function()
      require("dapui").toggle()
    end,
    desc = "DAP UI Toggle",
  },

  -- LSP
  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd>PickDiagnostics<cr>", desc = "Document Diagnostics" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
  {
    "<leader>li",
    "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
    desc = "Toggle Inlay Hints",
  },
  { "<leader>lI", "<cmd>LspInfo<cr>", desc = "LSP Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", desc = "Document Symbols" },
  { "<leader>lS", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", desc = "Workspace Symbols" },

  -- Git
  { "<leader>g", group = "Git" },
  {
    "<leader>gn",
    function()
      require("gitsigns").next_hunk()
    end,
    desc = "Next Hunk",
  },
  {
    "<leader>gp",
    function()
      require("gitsigns").prev_hunk()
    end,
    desc = "Prev Hunk",
  },

  -- Search
  { "<leader>s", group = "Search" },
  { "<leader>ss", "<cmd>lua MiniPick.builtin.grep_live()<CR>", desc = "Find Text" },
  { "<leader>sf", "<cmd>lua MiniPick.builtin.files()<CR>", desc = "Find files" },
  { "<leader>sF", "<cmd>Oil<cr>", desc = "File Browser" },
  { "<leader>sb", "<cmd>lua MiniPick.builtin.buffers()<CR>", desc = "Find Buffer" },
  { "<leader>sh", "<cmd>lua MiniPick.builtin.help()<CR>", desc = "Find Help" },
  { "<leader>sr", "<cmd>PickOldfiles<cr>", desc = "Open Recent File" },
  {
    "<leader>sg",
    function()
      local word = vim.fn.expand("<cword>")
      if word ~= "" then
        require("mini.pick").builtin.grep({ pattern = word })
      end
    end,
    desc = "Grep String",
  },
}

local virtual_mode_mappings = {
  -- Stay in indent mode
  { "<", proxy = "<gv", desc = "Increase Indentation" },
  { ">", proxy = ">gv", desc = "Decrease Indentation" },

  -- Opencode
  { "<leader>o", group = "Opencode" },
  {
    "<leader>oa",
    function()
      require("opencode").ask("@selection: ")
    end,
    desc = "Ask opencode about selection",
  },
  {
    "<leader>op",
    function()
      require("opencode").select_prompt()
    end,
    desc = "Select prompt",
  },
}

local setup = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  local which_key = require("which-key")
  which_key.setup({})

  local common_opts = {
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  which_key.add(normal_mode_mappings, vim.tbl_extend("force", common_opts, { mode = "n" }))
  which_key.add(virtual_mode_mappings, vim.tbl_extend("force", common_opts, { mode = "v" }))
end

return {
  "folke/which-key.nvim",
  config = setup,
}
