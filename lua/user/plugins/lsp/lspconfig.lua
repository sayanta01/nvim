return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			-- local status_ok, illuminate = pcall(require, "illuminate")
			-- if not status_ok then
			-- 	return
			-- end
			-- illuminate.on_attach(client)

			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			local opts = { noremap = true, silent = true }
			buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
			buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
			buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
			buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
			buf_set_keymap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
			buf_set_keymap("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
			buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
			buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
			buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
			buf_set_keymap("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
			buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
			buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
			-- buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
			-- buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local config = {
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
				-- scope = "cursor", -- only when cursor is on up
			},
		}
		vim.diagnostic.config(config)

		-- lspconfig["svelte"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = function(client, bufnr)
		-- 		on_attach(client, bufnr)
		--
		-- 		vim.api.nvim_create_autocmd("BufWritePost", {
		-- 			pattern = { "*.js", "*.ts" },
		-- 			callback = function(ctx)
		-- 				if client.name == "svelte" then
		-- 					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		-- 				end
		-- 			end,
		-- 		})
		-- 	end,
		-- })

		lspconfig["tsserver"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})

		lspconfig["html"].setup({
			filetypes = { "html", "php", "xml" },
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["cssls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		--[[ lspconfig["tailwindcss"].setup({ ]]
		--[[ 	capabilities = capabilities, ]]
		--[[ 	on_attach = on_attach, ]]
		--[[ }) ]]

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["sqlls"].setup({
			filetype = { "sql", "mysql" },
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["gopls"].setup({
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
					experimentalPostfixCompletions = true,
					gofumpt = true,
					staticcheck = true,
				},
			},
		})

		--[[ lspconfig["solargraph"].setup({ ]]
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

		lspconfig["clangd"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		--[[ lspconfig["omnisharp"].setup({ ]]
		--[[ 	on_attach = on_attach, ]]
		--[[ 	capabilities = capabilities, ]]
		--[[ }) ]]

		lspconfig["pyright"].setup({
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

		lspconfig["lua_ls"].setup({
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

		lspconfig["bashls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["marksman"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["dockerls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- lspconfig["graphql"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		-- })

		lspconfig["jsonls"].setup({
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

		lspconfig["yamlls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			on_new_config = function(new_config)
				new_config.settings.json.schemas = new_config.settings.json.schemas or {}
				vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
			end,
			settings = {
				yaml = {
					hover = true,
					-- completion = true,
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
	end,
}
