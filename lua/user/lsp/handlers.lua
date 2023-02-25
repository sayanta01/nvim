--[[ https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md ]]
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	--[[ local status_ok, illuminate = pcall(require, "illuminate") ]]
	--[[ if not status_ok then ]]
	--[[ 	return ]]
	--[[ end ]]
	--[[ illuminate.on_attach(client) ]]

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local config = {
		virtual_text = true, -- disable virtual text
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		signs = {
			active = signs, -- show signs
		},
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

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
	buf_set_keymap("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
end

-- diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end
-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

require("lspconfig")["clangd"].setup({
	filetypes = { "cs" },
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["bashls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["html"].setup({
	filetypes = { "html", "php", "xml" },
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["vimls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["texlab"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["dockerls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["marksman"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

require("lspconfig")["lua_ls"].setup({
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

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- off
				diagnosticMode = "workspace",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
})

require("lspconfig").solargraph.setup({
	filetypes = { "ruby", "eruby" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		solargraph = {
			diagnostics = true,
		},
		flags = {
			debounce_text_changes = 140,
		},
	},
})

require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
	flags = {
		debounce_text_changes = 140,
	},
})

require("lspconfig")["jsonls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
	init_options = {
		provideFormatter = true,
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
})

require("lspconfig")["jdtls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			cmd = {
				"rustup",
				"run",
				"stable",
				"rust-analyzer",
			},
			assist = {
				importMergeBehavior = "last",
				importPrefix = "by_self",
			},
			diagnostics = {
				disabled = { "unresolved-import" },
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
	--[[ require("rust-tools").setup(), ]]
})

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

--[[ require("lspconfig")["tailwindcss"].setup({ ]]
--[[ 	capabilities = capabilities, ]]
--[[ 	on_attach = on_attach, ]]
--[[ }) ]]
require("lspconfig")["yamlls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
})

--[[ require("lspconfig")["yamlls"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ 	settings = { ]]
--[[ 		yaml = { ]]
--[[ 			hover = true, ]]
--[[ 			completion = true, ]]
--[[ 			validate = true, ]]
--[[ 			schemaStore = { ]]
--[[ 				enable = true, ]]
--[[ 				url = "https://www.schemastore.org/api/json/catalog.json", ]]
--[[ 			}, ]]
--[[ 			schemas = { ]]
--[[ 				kubernetes = { ]]
--[[ 					"daemon.{yml,yaml}", ]]
--[[ 					"manager.{yml,yaml}", ]]
--[[ 					"restapi.{yml,yaml}", ]]
--[[ 					"role.{yml,yaml}", ]]
--[[ 					"role_binding.{yml,yaml}", ]]
--[[ 					"*onfigma*.{yml,yaml}", ]]
--[[ 					"*ngres*.{yml,yaml}", ]]
--[[ 					"*ecre*.{yml,yaml}", ]]
--[[ 					"*eployment*.{yml,yaml}", ]]
--[[ 					"*ervic*.{yml,yaml}", ]]
--[[ 					"kubectl-edit*.yaml", ]]
--[[ 				}, ]]
--[[ 			}, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]
