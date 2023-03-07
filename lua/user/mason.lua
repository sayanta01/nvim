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
		"yamlls",
		"ansiblels",
		"clangd", -- c, cpp
		"omnisharp", -- c#
		"gopls", -- go
		"jdtls", -- java
		"tailwindcss", -- javascript
		"tsserver",
		"jsonls",
		"lua_ls",
		"pyright", -- python
		"rust_analyzer",
		"cssmodules_ls",
		"angularls", -- typescript
		"marksman",
		"eslint",
		"graphql",
		"html",
		"cssls",
		"solargraph", -- "ruby_ls",
		"emmet_ls",
		"sqls",
		"dockerls",
		"bashls",
		"ltex",
		"awk_ls",
		"astro",
		"kotlin_language_server",
		"solidity",
		"vimls",
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	-- formatters & linters
	ensure_installed = {
		"yamlfmt", 		-- "yamllint",
		"gofumpt",
		"google-java-format",
		"eslint_d",
		"prettier",
		"stylua",
		"autopep8",
		"rubocop",
		"rustfmt",
		"markdownlint",
		"phpcbf",
		"shfmt",
		"clang_format",
		"sqlfluff",
	},
	automatic_installation = true,
})

require("mason-nvim-dap").setup({
	-- debugger
	ensure_installed = {
    "codelldb",
		"delve",
		"debugpy",
		"bash",
		"node2",
	},
	automatic_installation = true,
})
