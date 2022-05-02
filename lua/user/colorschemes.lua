-- local colorscheme = "default"
-- local colorscheme = "onedark"
-- local colorscheme = "tokyonight"
-- local colorscheme = 'monokai'
-- local colorscheme = 'gruvbox'
-- local colorscheme = 'solarized'
-- local colorscheme = "darkplus"
local colorscheme = 'nord'
--
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
