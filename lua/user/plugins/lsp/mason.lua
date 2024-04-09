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
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"rust_analyzer",
				"jdtls",
				"html",
				"cssls",
				"tsserver",
				"tailwindcss",
				"emmet_ls",
				"sqlls",
				"gopls",
				"pyright",
				"lua_ls",
				"bashls",
				"marksman",
				"dockerls",
				"jsonls",
				"yamlls",
				"svelte",
				"graphql",
			},
		})
	end,
}
