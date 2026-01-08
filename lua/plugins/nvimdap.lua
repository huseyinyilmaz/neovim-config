return {

	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local host = "127.0.0.1"
			local port_go = 38697
			local port_python = 38698
			-- Add delve adapter to dap
			dap.adapters.debugpy = {
				type = "server",
				host = host,
				port = port_python,
			}

			dap.configurations.python = {
				{
					name = "Attach to 127.0.0.1:38698", -- configuration for attaching to a running process
					type = "debugpy",
					request = "attach",
					mode = "remote",
				},
			}

			dap.adapters.delve = {
				type = "server",
				host = host,
				port = port_go,
			}
			-- Define configurations for Go debugging
			dap.configurations.go = {
				{
					name = "Attach to 127.0.0.1:38697", -- configuration for attaching to a running process
					type = "delve",
					request = "attach",
					mode = "remote",
				},
				-- {
				--   type = "delve",
				--   name = "Debug test", -- configuration for debugging test files
				--   request = "attach",
				--   mode = "test",
				--   program = "${file}"
				-- },
				-- -- works with go.mod packages and sub packages
				-- {
				--   type = "delve",
				--   name = "Debug test (go.mod)",
				--   request = "attach",
				--   mode = "test",
				--   program = "./${relativeFileDirname}"
				-- }
			}
		end,
	},
	{ "nvim-neotest/nvim-nio", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")
			dapui.setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
