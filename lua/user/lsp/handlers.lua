local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)

	--[[ local function buf_set_option(...) ]]
	--[[ 	vim.api.nvim_buf_set_option(bufnr, ...) ]]
	--[[ end ]]

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local config = {
		virtual_text = true, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)

	--[[ buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc") ]]

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
	buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts) --> formats the current buffer
	buf_set_keymap("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	buf_set_keymap("n", "<leader>lj", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<leader>lk", ":lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lr", ":lua vim.lsp.util.rename()<CR>", opts) --> renaname old_fname to new_fname
	buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
end

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})

require("lspconfig")["clangd"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["sumneko_lua"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig")["bashls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["gopls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["jsonls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	--[[   settings = { ]]
	--[[   json = { ]]
	--[[     schemas = require("schemastore").json.schemas(), ]]
	--[[   }, ]]
	--[[ }, ]]
	--[[ setup = { ]]
	--[[   commands = { ]]
	--[[     Format = { ]]
	--[[       function() ]]
	--[[         vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 }) ]]
	--[[       end, ]]
	--[[     }, ]]
	--[[   }, ]]
	--[[ }, ]]
})

require("lspconfig")["marksman"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--[[ require("lspconfig")["ltex"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]
--[[]]
--[[ require("lspconfig")["texlab"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]
--[[]]
--[[ require("lspconfig")["hls"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]
