-- https://github.com/goolord/alpha-nvim
local setup = function()
  local alpha = require('alpha')
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("o", "  Reckon obsidian notes.", ":edit ~/Dropbox/obsidian/reckon/init.md <CR>"),
    dashboard.button("O", "  Personal obsidian notes.", ":edit ~/Dropbox/obsidian/personal/init.md <CR>"),
    dashboard.button("s", "  Open SchoolConnect backend.", ":edit ~/reckon/schoolmeals/backend/run <CR>"),
    dashboard.button("S", "  Open SchoolConnect frontend.", ":edit ~/reckon/schoolmeals/frontend/run <CR>"),
    dashboard.button("v", "  Open neovim config.", ":edit ~/.config/nvim/init.lua <CR>"),
    -- dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end


return {
  "goolord/alpha-nvim",
  event = 'VimEnter',
  config = setup,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
