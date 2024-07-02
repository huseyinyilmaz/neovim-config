-- add custom keymaps for nvim tree
local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close'))
end

local function setup()
  local nvim_tree = require("nvim-tree")

  nvim_tree.setup({
    on_attach = on_attach,

    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },

    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
  })
end


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  -- dependencies = {
  -- "nvim-tree/nvim-web-devicons",
  -- },
  -- keys = { { "<F3>", ":NvimTreeFindFileToggle<CR>" } },
  config = setup,
}
