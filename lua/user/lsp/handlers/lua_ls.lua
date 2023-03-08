local lspconfig = require("lspconfig")
local utils = require("user.lsp.handlers.utils")

local	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	}

local opts = {
  on_attach = utils.on_attach,
  capabilities = utils.capabilities,
  settings = settings,
}

return function()
  local handler_name = 'lua_ls'
  lspconfig[handler_name].setup(opts)
  print('Custom lsp initialization is complete: ' .. handler_name)
end
