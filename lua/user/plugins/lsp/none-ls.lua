return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		mason_null_ls.setup({
			ensure_installed = {
				"google_java_format",
				"prettier",
				"stylua",
				"gofumpt",
				"isort",
				"black",
				"shfmt",
				"shellcheck",
				"pylint",
				"eslint_d",
			},
		})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- setup format on save
		--[[ local augroup = vim.api.nvim_create_augroup("LspFormatting", {}) ]]

		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			--[[ root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"), ]]
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.prettier.with({
					extra_filetypes = { "svelte" },
				}), -- js/ts formatter
				formatting.google_java_format,
				formatting.stylua,
				formatting.gofumpt,
				formatting.rustfmt,
				formatting.isort,
				formatting.black,
				formatting.shfmt,
				diagnostics.shellcheck,
				diagnostics.pylint,
				diagnostics.eslint_d,
				--[[ diagnostics.eslint_d.with({ -- js/ts linter ]]
				--[[ 	condition = function(utils) ]]
				--[[ 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- if root has .eslintrc.js .eslintrc.cjs ]]
				--[[ 	end, ]]
				--[[ }), ]]
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
