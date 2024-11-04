local setup = {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- Show record macros as notification message.
  opts = {
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
    -- add any options here
  },
  --
  -- Show record macros in sstatusline.
  -- opts = {
  --   sections = {
  --     lualine_x = {
  --       {
  --         require("noice").api.statusline.mode.get,
  --         cond = require("noice").api.statusline.mode.has,
  --         color = { fg = "#ff9e64" },
  --       }
  --     },
  --   },
  -- },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  }
}

-- return setup
return {}
