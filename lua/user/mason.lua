require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"angularls",
		"tsserver",
		"graphql",
		"rust_analyzer",
		"cssls",
		"tailwindcss",
		"cssmodules_ls",
		"tsserver",
		"html",
		"emmet_ls",
		"eslint",
		"jedi_language_server",
		"pyright",
		"pylsp",
		"jsonls",
		"sumneko_lua",
		"rust_analyzer",
		"bashls",
		"clangd",
		"yamlls",
	},
	automatic_installation = true,

	ui = {
		--[[ border = "rounded", ]]
		keymaps = {
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			update_all_packages = "U",
			check_outdated_packages = "C",
			uninstall_package = "X",
			cancel_installation = "<C-c>",
			apply_language_filter = "<C-f>",
		},
	},
})
