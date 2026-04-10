local opts = { noremap = true, silent = true }

-- Remap space as leader key (leader is set in config/lazy.lua)
vim.keymap.set("", "<Space>", "<Nop>", opts)

-- Insert --
-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode" })
