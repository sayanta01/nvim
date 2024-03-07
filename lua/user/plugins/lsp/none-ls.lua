return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		-- local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"google_java_format",
				"prettier",
				"stylua",
				"gofumpt",
				"shfmt",
				"shellcheck", -- bashls automatically uses
				"isort",
				"black",
				"pylint",
				"eslint_lsp",
			},
		})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- setup format on save
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			-- root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = { -- setup formatters & linters
				formatting.prettier.with({
					extra_filetypes = { "svelte" },
				}), -- js/ts formatter
				formatting.google_java_format,
				formatting.stylua,
				formatting.gofmt,
				formatting.shfmt,
				formatting.isort,
				formatting.black,
				-- diagnostics.pylint,
				-- diagnostics.eslint_d, -- js/ts linter
				-- diagnostics.eslint_d.with({
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
				-- 	end,
				-- }),
			},
			-- configure format on save
			--[[ on_attach = function(current_client, bufnr) ]]
			--[[ 	if current_client.supports_method("textDocument/formatting") then ]]
			--[[ 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr }) ]]
			--[[ 		vim.api.nvim_create_autocmd("BufWritePre", { ]]
			--[[ 			group = augroup, ]]
			--[[ 			buffer = bufnr, ]]
			--[[ 			callback = function() ]]
			--[[ 				vim.lsp.buf.format({ ]]
			--[[ 					filter = function(client) ]]
			--[[ 						--  only use null-ls for formatting instead of lsp server ]]
			--[[ 						return client.name == "null-ls" ]]
			--[[ 					end, ]]
			--[[ 					bufnr = bufnr, ]]
			--[[ 				}) ]]
			--[[ 			end, ]]
			--[[ 		}) ]]
			--[[ 	end ]]
			--[[ end, ]]
		})
	end,
}
