require("mason").setup({
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
				cancel_installation = "<C-c>",
				apply_language_filter = "<C-f>",
			},
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		--[[ "ansiblels", -- configure this ]]
		--[[ "ansiblels", ]]
		--[[ "prismals", ]]
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	-- formatters & linters
	ensure_installed = {
		-- "rubocop",
		"google-java-format",
		"yamlfmt",
		"phpcbf",
		"sqlfluff",
		"markdownlint",
		"shfmt",
		"gofumpt",
		"stylua",
		"black",
		"prettier", -- ts/js formatter
		"eslint_d", -- ts/js linter
		"js-debug-adapter",
	},
	automatic_installation = true,
})
