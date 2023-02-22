require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "",
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
		"yamlls",
		"ansiblels",
		"clangd", -- c, cpp, c#
		"gopls", -- go
		"jdtls", -- java
		"tailwindcss", -- javascript
		"tsserver",
		"jsonls",
		"lua_ls",
		"pyright", -- python
		"ruby_ls",
		"rust_analyzer",
		"cssmodules_ls",
		"angularls", -- typescript
		"marksman",
		"omnisharp",
		"eslint",
		"graphql",
		"html",
		"cssls",
		"emmet_ls",
		"sqlls",
		"dockerls",
		"bashls",
		"ltex",
		"vimls",
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	-- formatters & linters
	ensure_installed = {
		-- "yamllint",
		"yamlfmt",
		"clang_format",
		"gofumpt",
		"google-java-format",
		"eslint_d",
		"prettier",
		"stylua",
		"autopep8",
		"rubocop",
		"rustfmt",
		"scalafmt",
		"markdownlint",
		"phpcbf",
		"shfmt",
		"sqlfluff",
		"solhint",
	},
	automatic_installation = true,
})

require("mason-nvim-dap").setup({
	--[[ debugger ]]
	ensure_installed = {
		"delve",
		"codelldb",
		"python",
		"bash",
		"javadbg",
		"debugpy",
		"node2",
		"chrome",
		"firefox",
		"php",
	},
	automatic_installation = true,
})
