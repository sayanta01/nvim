return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		--[[ { ]]
		--[[ 	"WhoIsSethDaniel/mason-tool-installer.nvim", ]]
		--[[ 	cmd = { "MasonToolsInstall", "MasonToolsUpdate" }, ]]
		--[[ }, ]]
		--[[ "jay-babu/mason-nvim-dap.nvim", ]]
	},
	config = function()
		-- import mason
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		--[[ local mason_tool_installer = require("mason-tool-installer") ]]

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
				"graphql",
				"jsonls",
				"yamlls",

				"svelte",
			},
			automatic_installation = true,
		})

		--[[ mason_tool_installer.setup({ ]]
		--[[ 	ensure_installed = { ]]
		--[[ 		"stylua", ]]
		--[[ 		-- "luacheck", -- linting ]]
		--[[]]
		--[[ 		"gofumpt", ]]
		--[[ 		"google-java-format", ]]
		--[[]]
		--[[ 		"yamlfmt", ]]
		--[[ 		"phpcbf", ]]
		--[[]]
		--[[ 		"markdownlint", ]]
		--[[ 		-- "sqlfluff", -- linting ]]
		--[[]]
		--[[ 		"prettier", ]]
		--[[ 		"eslint_d", ]]
		--[[]]
		--[[ 		"shfmt", ]]
		--[[ 		"shellcheck", ]]
		--[[]]
		--[[ 		"isort", ]]
		--[[ 		"black", ]]
		--[[ 		"pylint", ]]
		--[[ 	}, ]]
		--[[ 	-- run_on_start = true, ]]
		--[[ }) ]]
	end,
}
