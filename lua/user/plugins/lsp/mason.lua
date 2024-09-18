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
				"rust_analyzer",
				"gopls",
				"bashls",
				"pyright",
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
				"ts_ls",
				"emmet_ls",
				-- "intelephense",
				"sqlls",
				"marksman",
				"dockerls",
				"svelte",
				"graphql",
				"jsonls",
				"yamlls",
			},
		})
	end,
}
