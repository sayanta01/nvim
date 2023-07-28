require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "",
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
		--[[ "tailwindcss", -- javascript  -- configure this ]]
		--[[ "cssmodules_ls", -- configure this ]]
		--[[ "angularls", -- typescript -- configure this ]]
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	-- formatters & linters
	ensure_installed = {
		"yamlfmt", -- "yamllint",
		"phpcbf",
		"sqlfluff",
		"markdownlint",
		"shfmt",
		"eslint_d",
		"rubocop",
		"google-java-format",
		"gofumpt",
		"stylua",
		"black",
		"prettier",
	},
	automatic_installation = true,
})

require("mason-nvim-dap").setup({
	ensure_installed = {
		"codelldb",
		"debugpy",
		"delve",
		"node2",
	},
	automatic_installation = true,
})
