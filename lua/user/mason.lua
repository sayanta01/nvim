require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"angularls",
		"tsserver",
		"graphql",
		"marksman",
		"rust_analyzer",
		"cssls",
		"tailwindcss",
		"cssmodules_ls",
		"dockerls",
		"html",
		"emmet_ls",
		"eslint",
		"jedi_language_server",
		"pyright",
		"pylsp",
		"jsonls",
		"sumneko_lua",
		"bashls",
		"clangd",
		"yamlls",
	},
	automatic_installation = true,

	ui = {
		--[[ border = "rounded", ]]
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
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

require("mason-null-ls").setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"shfmt",
		"stylua",
		"gofumpt",
		"phpcbf",
		"markdownlint",
		"prettier",
		"autopep8",
		"eslint_d",
		--[[ "rubocop", ]]
		--[[ "sqlfluff", ]]
		--[[ "solhint", ]]
	},
	automatic_installation = true,
})
