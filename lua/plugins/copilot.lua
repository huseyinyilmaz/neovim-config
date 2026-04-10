return {
	"github/copilot.vim",
	config = function()
		-- Enable copilot
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<C-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" })
	end,
}
