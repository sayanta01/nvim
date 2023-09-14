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
        apply_language_filter = "<C-f>",
				cancel_installation = "<C-c>",
			},
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		--[[ "ansiblels", -- configure this ]]
		--[[ "prismals", ]]
	},
	automatic_installation = true,
})
