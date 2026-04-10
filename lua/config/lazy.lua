-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- FIXME: Disabled — lazy.nvim's background checker uses vim.wait() which
  -- processes vim.schedule callbacks, triggering a Neovim 0.12 treesitter
  -- bug ('attempt to call method range (a nil value)' in languagetree.lua).
  -- This is a Neovim core bug, not a parser conflict. Use :Lazy check manually.
  -- Track: https://github.com/neovim/neovim/issues/ (treesitter async parsing)
  checker = { enabled = false },
})
