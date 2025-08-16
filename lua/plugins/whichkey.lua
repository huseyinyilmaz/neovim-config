local harpoon = require("harpoon")
local normal_mode_mappings = {
  -- tabline shortcuts
  { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc="Next Buffer" },
  {"<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc="Previous Buffer" },
  { "<A-l>", "<cmd>BufferLineMoveNext<CR>", desc="Move Buffer to Left" },
  {"<A-h>", "<cmd>BufferLineMovePrev<CR>", desc="Move Buffer to Right" },
  -- resize current tab
  { "<C-Up>", ":resize +2<CR>", desc="Increase width of current buffer" },
  { "<C-Down>", ":resize -2<CR>", desc="Decrease width of current buffer" },
  { "<C-Left>", ":vertical resize -2<CR>", desc="Increase height of current buffer" },
  { "<C-Right>", ":vertical resize +2<CR>", desc="Decrease height of current buffer" },

  { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc="Show Type Info" },
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc="Show Signature Help" },

  { "gq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc="Show All LSP Errors" },
  { "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<cr>', desc="Show Diagnostics" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc="Go to Definition" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc="Go to Decleration" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc="Go to Implementation" },
  { "gr", "<cmd>Telescope lsp_references theme=ivy<CR>", desc="Show LSP References" },

  {"<leader>a", "<cmd>Alpha<cr>", desc="Alpha" },
  {"<leader>c", "<cmd>bdelete<CR>", desc="Close Buffer" },
  {"<leader>h", "<cmd>nohlsearch<CR>", desc="No Highlight" },
  {"<leader>H", "<cmd>checkhealth<CR>", desc="Check Health" },

  {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc="Explorer" },
  {"<leader>E", "<cmd>Telescope live_grep theme=ivy<cr>", desc="Find Text" },
  {"<leader>f", "<cmd>Telescope file_browser theme=ivy<cr>", desc="File Browser" },
  {"<leader>F", "<cmd>Telescope find_files theme=ivy<cr>", desc="Find files" },

  -- LSP
  {"<leader>l", group="LSP"},
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc="Code Action" },
  { "<leader>lc", "<cmd>TSContextToggle<cr>", desc="Toggle Context" },
  {"<leader>ld", "<cmd>Telescope diagnostics<cr>", desc="Document Diagnostics" },
  {"<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc="Workspace Diagnostics" },
  {"<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc="Format" },
  {"<leader>li", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", desc="Toggle Inlay Hints" },
  {"<leader>lI", "<cmd>LspInfo<cr>", desc="LSP Info" },
  -- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  {"<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc="Next Diagnostic" },
  {"<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc="Prev Diagnostic" },
  {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc="CodeLens Action" },
  {"<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc="Quickfix" },
  {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc="Rename" },
  {"<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc="Document Symbols" },
  {"<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc="Workspace Symbols" },
  {"<leader>lo",  "<cmd>SymbolsOutline<cr>", desc="Symbol Outline Sidebar" },

  -- Search
  {"<leader>s", group="Search"},
  {"<leader>sb", "<cmd>Telescope git_branches<cr>", desc="Checkout branch" },
  {"<leader>sc", "<cmd>Telescope colorscheme<cr>", desc="Colorscheme" },
  {"<leader>sh", "<cmd>Telescope help_tags<cr>", desc="Find Help" },
  {"<leader>sH", "<cmd>Telescope harpoon marks<cr>", desc="Harpoon Marks" },
  {"<leader>sM", "<cmd>Telescope man_pages<cr>", desc="Man Pages" },
  {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc="Open Recent File" },
  {"<leader>sR", "<cmd>Telescope registers<cr>", desc="Registers" },
  {"<leader>sk", "<cmd>Telescope keymaps<cr>", desc="Keymaps" },
  {"<leader>sC", "<cmd>Telescope commands<cr>", desc="Commands" },
  {"<leader>sg", "<cmd>Telescope grep_string<cr>", desc="Grep String" },

  -- Harpoon
  {"<leader>m", group="Harpoon"},
  { "<leader>ml", "<cmd>Telescope harpoon marks<cr>", desc="List Marks" },
  { "<leader>mL", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc="List Marks" },
  { "<leader>mt", "<cmd>lua require(\"harpoon.term\").gotoTerminal()<cr>", desc="Terminal" },
  { "<leader>ma", function() harpoon:list():add() end, desc="Add Mark" },
  { "<leader>md", function() harpoon:list():remove() end, desc="Remove Mark" },
  { "<leader>mn", "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>", desc="Next Mark" },
  { "<leader>mp", "<cmd>lua require(\"harpoon.ui\").nav_prev()<cr>", desc="Prev Mark" },
  { "<leader>m1",  function() harpoon:list():select(1) end, desc="Select Mark 1" },
  { "<leader>m2",  function() harpoon:list():select(2) end, desc="Select Mark 2" },
  { "<leader>m3",  function() harpoon:list():select(3) end, desc="Select Mark 3" },
  { "<leader>m4",  function() harpoon:list():select(4) end, desc="Select Mark 4" },

  -- Opencode
  { "<leader>o", group="Opencode"},
  { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
  { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode' },
  { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select prompt' },
  { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
  { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
  { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
  { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },

}


local virtual_mode_mappings = {

  -- Stay in indent mode
  { "<", proxy="<gv", desc="Increase Indentation" },
  { ">", proxy=">gv", desc="Decrease Indentation" },

  -- Opencode
  { "<leader>o", group="Opencode"},
  { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc='Ask opencode about selection' },
  { '<leader>op', function() require('opencode').select_prompt() end, desc='Select prompt' },
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
    mode = "v",     -- VIRTUAL mode (It covers character, line and box virtual modes')
    -- prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  which_key.add(normal_mode_mappings, normal_mode_opts)
  which_key.add(virtual_mode_mappings, virtual_mode_opts)
end


return {
  "folke/which-key.nvim",
  config = setup,
}
