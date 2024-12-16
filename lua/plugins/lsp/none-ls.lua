return {
	"nvimtools/none-ls.nvim",
	event = "BufReadPost",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	keys = {
		{ "<leader>pn", ":NullLsInfo<cr>", desc = "Nulls" },
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"shellcheck", -- bashls automatically uses
				"shfmt",
				"isort",
				"black",
				-- "pylint",
				-- "eslint",
			},
		})

		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				formatting.prettier.with({ extra_filetypes = { "svelte" } }),
				formatting.google_java_format,
				formatting.gofmt,
				formatting.clang_format,
				formatting.shfmt,
				formatting.stylua,
				formatting.isort,
				formatting.black,
				-- diagnostics.pylint,
			},

			-- Format on save
			-- on_attach = function(current_client, bufnr)
			-- 	if current_client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({
			-- 					bufnr = bufnr,
			-- 					filter = function(client)
			-- 						return client.name == "null-ls"
			-- 					end,
			-- 				})
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
}
