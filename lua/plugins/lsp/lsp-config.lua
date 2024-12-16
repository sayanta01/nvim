return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true, desc = "which_key_ignore" }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.diagnostic.config({
			virtual_text = {
				source = "if_many",
				prefix = "▪",
			},
			signs = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				border = "rounded",
				source = "if_many",
				prefix = "",
			},
		})

		lspconfig["clangd"].setup({
			capabilities = vim.tbl_deep_extend("force", capabilities, {
				offsetEncoding = { "utf-16" },
			}),
			on_attach = on_attach,
			cmd = {
				"clangd",
				"-header-insertion=iwyu",
			},
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"rustup",
				"run",
				"stable",
				"rust-analyzer",
			},
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				gopls = {
					gofumpt = true,
					analyses = {
						unusedparams = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
				},
			},
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim", "it", "describe", "before_each", "after_each" },
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

		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "basic", -- off
						-- inlayHints = {
						-- 	variableTypes = true,
						-- 	functionReturnTypes = true,
						-- },
					},
				},
			},
		})

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
		})

		lspconfig["emmet_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- lspconfig.eslint.setup({
		-- 	on_attach = function(bufnr)
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			buffer = bufnr,
		-- 			command = "EslintFixAll",
		-- 		})
		-- 	end,
		-- })

		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["sqlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["solargraph"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
			settings = {
				solargraph = {
					diagnostics = true,
				},
			},
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			-- lazy-load schemastore when needed
			on_new_config = function(new_config)
				new_config.settings.json.schemas = new_config.settings.json.schemas or {}
				vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
			end,
			settings = {
				json = {
					format = { enable = true },
					validate = { enable = true },
				},
			},
		})

		lspconfig["yamlls"].setup({
			capabilities = vim.tbl_deep_extend("force", capabilities, {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}),
			on_attach = on_attach,
			on_new_config = function(new_config)
				new_config.settings.yaml.schemas = vim.tbl_deep_extend(
					"force",
					new_config.settings.yaml.schemas or {},
					require("schemastore").yaml.schemas()
				)
			end,
			settings = {
				redhat = { telemetry = { enabled = false } },
				yaml = {
					keyOrdering = false,
					format = { enable = true },
					validate = true,
					schemaStore = {
						-- Must disable built-in schemaStore support to use
						-- schemas from SchemaStore.nvim plugin
						enable = false,
						url = "",
					},
				},
			},
		})
	end,
}
