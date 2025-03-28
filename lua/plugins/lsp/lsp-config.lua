return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, silent = true }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			if client.supports_method("textDocument/inlayHint") then
				vim.keymap.set("n", "<leader>uh", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
				end)
			end
		end

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.diagnostic.config({
			virtual_text = { source = "if_many", prefix = "▪" },
			signs = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = { focusable = true, border = "rounded", source = "if_many", prefix = "" },
		})

		local servers = {
			-- clangd = {
			--   capabilities = vim.tbl_deep_extend("force", capabilities, {
			--     offsetEncoding = { "utf-16" },
			--   }),
			--   cmd = { "clangd", "-header-insertion=iwyu" },
			-- },

			-- rust_analyzer = {
			-- 	cmd = { "rustup", "run", "stable", "rust-analyzer" },
			-- 	settings = {
			-- 		["rust-analyzer"] = {
			-- 			cargo = { allFeatures = true },
			-- 			checkOnSave = { command = "clippy" },
			-- 		},
			-- 	},
			-- },

			-- gopls = {
			--   settings = {
			--     gopls = {
			--       gofumpt = true,
			--       analyses = { unusedparams = true },
			--       usePlaceholders = true,
			--       staticcheck = true,
			--     },
			--   },
			-- },

			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
							checkThirdParty = false,
						},
					},
				},
			},

			pyright = {
				settings = {
					python = {
						analysis = {
							diagnosticMode = "workspace",
							typeCheckingMode = "basic",
						},
					},
				},
			},

			-- svelte = {
			--   on_attach = function(client, bufnr)
			--     on_attach(client, bufnr)
			--     vim.api.nvim_create_autocmd("BufWritePost", {
			--       pattern = { "*.js", "*.ts" },
			--       callback = function(ctx)
			--         if client.name == "svelte" then
			--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
			--         end
			--       end,
			--     })
			--   end,
			-- },

			jsonls = {
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
			},

			yamlls = {
				capabilities = vim.tbl_deep_extend("force", capabilities, {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				}),
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
			},

			vtsls = {
				settings = {
					complete_function_calls = true,
					autoUseWorkspaceTsdk = true,
					experimental = {
						maxInlayHintLength = 30,
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},

					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = true,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
					},
				},
			},
		}

		servers.vtsls.settings.javascript =
			vim.tbl_deep_extend("force", {}, servers.vtsls.settings.typescript, servers.vtsls.settings.javascript or {})

		require("mason-lspconfig").setup({
			ensure_installed = vim.list_extend(
				{ "bashls", "html", "cssls", "emmet_language_server" },
				vim.tbl_keys(servers)
			),
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					server.on_attach = server.on_attach or on_attach
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
