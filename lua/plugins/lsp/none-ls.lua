return {
	"nvimtools/none-ls.nvim",
	event = "BufReadPost",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
			},

			-- Format on save
			-- on_attach = function(client, bufnr)
			--   if client.supports_method("textDocument/formatting") then
			--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			--     vim.api.nvim_create_autocmd("BufWritePre", {
			--       group = augroup,
			--       buffer = bufnr,
			--       callback = function()
			--         vim.lsp.buf.format({
			--           bufnr = bufnr,
			--           filter = function(c)
			--             return c.name == "null-ls"
			--           end,
			--         })
			--       end,
			--     })
			--   end
			-- end,
		})

		local mr = require("mason-registry")
		for _, tool in ipairs({ "prettier", "stylua", "shellcheck", "shfmt", "isort", "black" }) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
