return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				php = { "phpcbf" },
				java = { "google_java_format" },
				markdown = { "prettier" },
				go = { "gofumpt" },
				rust = { "rustfmt" },
				--[[ ruby = { "rubocop" }, ]]
				--[[ bash = { " shfmt" }, ]]
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		--[[ vim.keymap.set({ "n", "v" }, "<leader>mp", function() ]]
		--[[ 	conform.format({ ]]
		--[[ 		lsp_fallback = true, ]]
		--[[ 		async = false, ]]
		--[[ 		timeout_ms = 1000, ]]
		--[[ 	}) ]]
		--[[ end, { desc = "Format file or range (in visual mode)" }) ]]
	end,
}
