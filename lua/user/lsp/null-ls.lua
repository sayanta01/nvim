local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- formatting
	--[[ formatting.rubocop, ]]
	formatting.google_java_format,
	formatting.yamlfmt,
	formatting.phpcbf,
	formatting.markdownlint,
	formatting.shfmt,
	formatting.rustfmt,
	formatting.gofumpt,
	formatting.stylua,
	formatting.black,
	formatting.prettier.with({
		extra_filetypes = { "toml" },
		extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
	}),

	-- code actions
	-- code_actions.eslint_d,

	-- diagnostics
	diagnostics.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
		end,
	}),
}

--[[ local lsp_formatting = function(bufnr) ]]
--[[ 	vim.lsp.buf.format({ ]]
--[[ 		filter = function(client) ]]
--[[ 			-- apply whatever logic you want (in this example, we'll only use null-ls) ]]
--[[ 			return client.name == "null-ls" ]]
--[[ 		end, ]]
--[[ 		bufnr = bufnr, ]]
--[[ 	}) ]]
--[[ end ]]
-- if you want to set up formatting on save, you can use this as a callback
--[[ local augroup = vim.api.nvim_create_augroup("LspFormatting", {}) ]]
--[[ local on_attach = function(client, bufnr) ]]
--[[ 	if client.supports_method("textDocument/formatting") then ]]
--[[ 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr }) ]]
--[[ 		vim.api.nvim_create_autocmd("BufWritePre", { ]]
--[[ 			group = augroup, ]]
--[[ 			buffer = bufnr, ]]
--[[ 			callback = function() ]]
--[[ 				lsp_formatting(bufnr) ]]
--[[ 			end, ]]
--[[ 		}) ]]
--[[ 	end ]]
--[[ end ]]

null_ls.setup({
	sources = sources,
	--[[ on_attach = on_attach, ]]
})
