return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"jdtls",
				"clangd",
				-- "rust_analyzer",
				-- "gopls",
				"lua_ls",
				"bashls",
				"pyright",
				"html",
				"cssls",
				"ts_ls",
				-- "svelte",
				-- "graphql",
				"emmet_language_server",
				"marksman",
				"dockerls",
				"jsonls",
				"yamlls",
			},
		})
	end,
}
