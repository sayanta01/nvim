require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd", -- c, cpp, c#
		"cssls",
		"omnisharp",
		"gopls",
		"jdtls", -- java
		"tailwindcss", -- javascript
		"tsserver",
		"cssmodules_ls",
		"eslint",
		"jsonls",
		"sumneko_lua",
		"jedi_language_server", -- python
		"pyright",
		"pylsp",
		"ruby_ls",
		"rust_analyzer",
		"angularls", -- typescript
		"marksman",
		"graphql",
		"html",
		"emmet_ls",
		"sqlls",
		"dockerls",
		"bashls",
		"ltex",
		"yamlls",
		"vimls",
	},
	automatic_installation = true,

	ui = {
		border = "rounded",
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
		"yamllint",
		"clang_format",
		"gofumpt",
		"eslint_d",
		"prettier",
		"stylua",
		"autopep8",
		"rustfmt",
		"markdownlint",
		"phpcbf",
		"shfmt",
		"yamlfmt",
		"rubocop",
		--[[ "sqlfluff", ]]
		--[[ "solhint", ]]
	},
	automatic_installation = true,
})

require("mason-nvim-dap").setup({
	--[[ debugger ]]
	ensure_installed = {
		"delve",
		"python",
		"bash",
		"javadbg",
		"node2",
		"chrome",
		"firefox",
		"php",
	},
	automatic_installation = true,
})
