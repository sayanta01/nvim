local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

local options = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}

return options
