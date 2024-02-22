return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUninstall" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
					keymaps = {
						toggle_package_expand = "<CR>",
						install_package = "i",
						update_package = "u",
						check_package_version = "c",
						update_all_packages = "U",
						check_outdated_packages = "C",
						uninstall_package = "X",
						apply_language_filter = "<C-f>",
						cancel_installation = "<C-c>",
					},
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
        "rust-analyzer",
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
			automatic_installation = true,
		})
	end,
}
