return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
    -- stylua: ignore
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, opts)
        vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, opts)
        vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
      end,
    })

		vim.diagnostic.config({
			virtual_text = { source = "if_many", prefix = "▪" },
			signs = false,
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
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

		for server_name, config in pairs(servers) do
			vim.lsp.config(server_name, config)
		end

		require("mason-lspconfig").setup({
			ensure_installed = vim.list_extend(
				{ "html", "cssls", "vtsls", "marksman", "bashls", "basedpyright" },
				vim.tbl_keys(servers)
			),
		})
	end,
}
