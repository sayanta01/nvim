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
		"ansiblels",
		"clangd",
		"omnisharp", -- c#
		"yamlls",
		--[[ "jdtls", ]]
		--[[ "tailwindcss", -- javascript  -- configure this ]]
		--[[ "eslint", -- configure this ]]
		--[[ "cssmodules_ls", -- configure this ]]
		--[[ "angularls", -- typescript -- configure this ]]
		"jsonls",
		"marksman",
		"html",
		"cssls",
		"emmet_ls",
		"sqlls",
		"dockerls",
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	-- formatters & linters
	ensure_installed = {
		"yamlfmt", -- "yamllint",
		"gofumpt",
		"google-java-format",
		"eslint_d",
		"prettier",
		"stylua",
		"autopep8",
		"rubocop",
		"rustfmt",
		"markdownlint",
		"shfmt",
		"clang_format",
		"phpcbf",
		"sqlfluff",
	},
	automatic_installation = true,
})

require("mason-nvim-dap").setup({
	-- debugger
	ensure_installed = {
		--[[ "codelldb", ]]
		--[[ "debugpy", ]]
		--[[ "delve", ]]
		--[[ "node2", ]]
	},
	automatic_installation = true,
})
