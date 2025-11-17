return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- stylua: ignore
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
      end,
    })

		vim.diagnostic.config({
			virtual_text = { source = "if_many", prefix = "▪" },
			signs = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = { focusable = true, border = "rounded", source = "if_many", prefix = "" },
		})

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			},

			jsonls = {
				settings = {
					json = {
						format = { enable = true },
						validate = { enable = true },
					},
				},
			},
		}

		require("mason-lspconfig").setup({
			ensure_installed = vim.list_extend(
				{ "html", "cssls", "vtsls", "marksman", "bashls", "basedpyright" },
				vim.tbl_keys(servers)
			),
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
