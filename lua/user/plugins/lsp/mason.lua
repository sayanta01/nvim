return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUninstall" },
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
				"rust_analyzer",
				"jdtls",
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"sqlls",
				"gopls",
				"clangd",
				"pyright",
				"lua_ls",
				"bashls",
				"marksman",
				"dockerls",
				"jsonls",
				"yamlls",
				"graphql",
				"svelte",
			},
			-- automatic_installation = false,
		})
	end,
}
