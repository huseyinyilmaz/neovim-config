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
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
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
-- vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

vim.opt.shortmess:append("c")

vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.exrc = true -- load .nvim.lua/.nvimrc/.exrc (trust-based in 0.12+)

-- vim.cmd [[set iskeyword+=-]]   -- This lets - character not seperate words. so dw would delete all word and not the word upto - character.
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Neovim 0.12 auto-enables treesitter highlighting for bundled parsers
-- (lua, vim, vimdoc, markdown, c, query). For plugin-installed parsers
-- (go, python, rust, etc.) we need to enable it manually. We defer via
-- vim.schedule to avoid a race condition in Neovim's async treesitter
-- parsing that causes 'attempt to call method range (a nil value)'.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf = args.buf
    -- Skip if treesitter highlighting is already active (bundled parsers)
    if vim.treesitter.highlighter.active[buf] then
      return
    end
    -- Check if a parser exists for this filetype's language
    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
    if not lang then
      return
    end
    local ok = pcall(vim.treesitter.language.inspect, lang)
    if not ok then
      return
    end
    -- Defer to avoid race with async treesitter parsing
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(buf) and not vim.treesitter.highlighter.active[buf] then
        pcall(vim.treesitter.start, buf, lang)
      end
    end)
  end,
})

