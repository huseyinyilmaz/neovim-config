-- :help options
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- If we are running inside WSL, use win32yank.exe for clipboard support.
-- Make sure win32yank.exe is in your PATH on windows side.
-- For example here is where mine is:
-- $ which win32yank.exe
-- /mnt/c/Users/yilmah/AppData/Local/Microsoft/WindowsApps/win32yank.exe
--
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
vim.opt.cmdheight = 1 -- command line height
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.termguicolors is enabled by default in Neovim 0.12+
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.number = true -- set numbered lines
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8

vim.opt.shortmess:append("c")

vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.exrc = true -- load .nvim.lua/.nvimrc/.exrc (trust-based in 0.12+)

-- Neovim 0.12 auto-enables treesitter highlighting for bundled parsers
-- (c, lua, vim, vimdoc, markdown, markdown_inline, query) via ftplugins.
-- For plugin-installed parsers (go, python, rust, etc.), enable highlighting
-- generically on FileType. See `lua/plugins/treesitter.lua` for the parser
-- install list -- adding `:TSInstall <lang>` later is picked up automatically.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
