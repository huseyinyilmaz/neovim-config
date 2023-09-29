-- local nvimtree = require("nvim-tree");

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons = {
local nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}


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

local nvim_tree = require("nvim-tree")

-- local nvim_tree_config = require("nvim-tree.config")

-- local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  on_attach=on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  --[[ ignore_ft_on_setup = { ]]
  --[[   "startify", ]]
  --[[   "dashboard", ]]
  --[[   "alpha", ]]
  --[[ }, ]]
  -- auto_close = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
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
  view = {
    width = 30,
    -- height = 30,
    -- hide_root_folder = false,
    side = "left",
    -- mappings = {
    --   custom_only = false,
    --   list = {
    --     { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
    --     { key = "h", cb = tree_cb "close_node" },
    --     { key = "v", cb = tree_cb "vsplit" },
    --   },
    -- },
    number = false,
    relativenumber = false,
  },
  renderer = {
    icons = {
      glyphs = nvim_tree_icons,
    },
  },
}
