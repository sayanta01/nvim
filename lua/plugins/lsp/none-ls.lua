return {
	"nvimtools/none-ls.nvim",
	event = "BufReadPost",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
	},
	keys = {
		{ "<leader>pn", ":NullLsInfo<cr>", desc = "Nulls" },
	},
	config = function()
		require("mason").setup()

		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				formatting.prettier.with({ extra_filetypes = { "svelte" } }),
				formatting.clang_format,
				formatting.google_java_format,
				formatting.stylua,
				formatting.shfmt,
				formatting.isort,
				formatting.black,
			},

			-- Format on save
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({
			-- 					bufnr = bufnr,
			-- 					filter = function(c)
			-- 						return c.name == "null-ls"
			-- 					end,
			-- 				})
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})

		local mason_registry = require("mason-registry")
		for _, tool in ipairs({ "prettier", "stylua", "shellcheck", "shfmt", "isort", "black" }) do
			local p = mason_registry.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
