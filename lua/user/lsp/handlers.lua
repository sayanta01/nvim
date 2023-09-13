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

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local config = {
		virtual_text = true, -- disable virtual text
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			prefix = "",
			--[[ scope = "cursor", ]]
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
	buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
	--[[ buf_set_keymap("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts) ]]
	--[[ buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts) ]]
	--[[ buf_set_keymap("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts) ]]
	--[[ buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts) ]]
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

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
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

require("lspconfig")["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

require("lspconfig")["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

require("lspconfig")["sqlls"].setup({
	filetype = { "sql", "mysql" },
	on_attach = on_attach,
	capabilities = capabilities,
})

local rust_setup, rt = pcall(require, "rust-tools")
if not rust_setup then
	return
end

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
codelldb:get_install_path()
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rt.setup({
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<Leader>k",
				":lua require('rust-tools.hover_actions').hover_actions()<CR>",
				opts
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<Leader>a",
				":lua require('rust-tools.code_action_group').code_action_group()<CR>",
				opts
			)
		end,
		tools = {
			hover_actions = {
				auto_focus = true,
			},
		},
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				procMacro = {
					enable = true,
					ignored = {
						["async-trait"] = { "async_trait" },
						["napi-derive"] = { "napi" },
						["async-recursion"] = { "async_recursion" },
					},
				},
				lens = {
					enable = true,
				},
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
			},
		},
	},
})

require("lspconfig")["gopls"].setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			--[[ flags = { ]]
			--[[ 	debounce_text_changes = 150, ]]
			--[[ }, ]]
			experimentalPostfixCompletions = true,
			gofumpt = true,
			staticcheck = true,
		},
	},
})

--[[ require("lspconfig")["kotlin_language_server"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]

--[[ require("lspconfig")["solargraph"].setup({ ]]
--[[ 	filetypes = { "ruby", "eruby" }, ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ 	root_dir = require("lspconfig").util.root_pattern("Gemfile"), ]]
--[[ 	single_file_support = true, ]]
--[[ 	settings = { ]]
--[[ 		solargraph = { ]]
--[[ 			diagnostics = true, ]]
--[[ 		}, ]]
--[[ 		flags = { ]]
--[[ 			debounce_text_changes = 150, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]

--[[ require("lspconfig")["astro"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]

require("lspconfig")["clangd"].setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

--[[ require("lspconfig")["omnisharp"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetype = { "python" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic", -- off
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
})

require("lspconfig")["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
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

--[[ require("lspconfig")["awk_ls"].setup({ ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]

require("lspconfig")["marksman"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["dockerls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--[[ require("lspconfig")["graphql"].setup({ ]]
--[[ 	capabilities = capabilities, ]]
--[[ 	on_attach = on_attach, ]]
--[[ 	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" }, ]]
--[[ }) ]]

require("lspconfig")["jsonls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_new_config = function(new_config)
		new_config.settings.json.schemas = new_config.settings.json.schemas or {}
		vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
	end,
	settings = {
		json = {
			format = {
				enable = true,
			},
			validate = { enable = true },
		},
	},
})

require("lspconfig").yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_new_config = function(new_config)
		new_config.settings.json.schemas = new_config.settings.json.schemas or {}
		vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
	end,
	settings = {
		yaml = {
			hover = true,
			--[[ completion = true, ]]
			format = {
				enable = true,
			},
			validate = true,
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
		},
	},
})
