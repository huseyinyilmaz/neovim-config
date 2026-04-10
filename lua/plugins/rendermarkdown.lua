return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		enabled = false,

		win_options = {
			-- visually wrap long lines in the window while rendered
			wrap = { default = false, rendered = true },

			-- optional, makes wrapped lines indent nicely
			linebreak = { default = false, rendered = true },
			breakindent = { default = false, rendered = true },

			-- optional, what to show at the start of wrapped screen-lines
			showbreak = { default = "", rendered = "  " },
		},
	},
}
