-- return { "catppuccin/nvim", name = "catppuccin-macchiato", priority = 1000 }
-- return { "catppuccin/nvim", name = "catppuccin-latte", priority = 1000 }
-- return { "catppuccin/nvim", name = "catppuccin-mocha", priority = 1000 }
-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
-- return { "catppuccin/nvim", name = "catppuccin-frappe", priority = 1000 }
--
-- return { "polirritmico/monokai-nightasty.nvim", lazy = false, priority = 1000 }
--
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme gruvbox")
  end,

  opts = ...
}

-- return { 'maxmx03/solarized.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.o.background = 'dark' -- or 'light'
--
--       vim.cmd.colorscheme 'solarized'
--     end,
--   }


-- return {
--   "folke/tokyonight.nvim",
--   config = function()
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }
