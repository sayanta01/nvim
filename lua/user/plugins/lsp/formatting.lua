return {
	-- "stevearc/conform.nvim",
	-- lazy = false,
	-- event = { "BufWritePre" },
	-- cmd = { "ConformInfo" },
	-- keys = {
	-- 	{
	-- 		"<leader>lm",
	-- 		function()
	-- 			require("conform").format({ async = true, lsp_fallback = true })
	-- 		end,
	-- 		mode = { "n", "v" },
	-- 		desc = "Format buffer",
	-- 	},
	-- },
	-- dependencies = {
	-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	config = function()
	-- 		local mason_tool_installer = require("mason-tool-installer")
	-- 		mason_tool_installer.setup({
	-- 			ensure_installed = {
	-- 				-- "google_java_format",
	-- 				"prettier",
	-- 				"gofumpt",
	-- 				"stylua",
	-- 				"shfmt",
	-- 				"shellcheck", -- bashls automatically uses
	-- 				"isort",
	-- 				"black",
	-- 				-- "pylint",
	-- 				-- "eslint",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- opts = {
	-- 	formatters_by_ft = {
	-- 		-- java = { "google-java-format" },
	-- 		html = { "prettier" },
	-- 		css = { "prettier" },
	-- 		scss = { "prettier" },
	-- 		javascript = { "prettier" },
	-- 		typescript = { "prettier" },
	-- 		javascriptreact = { "prettier" },
	-- 		typescriptreact = { "prettier" },
	-- 		vue = { "prettier" },
	-- 		json = { "prettier" },
	-- 		jsonc = { "prettier" },
	-- 		yaml = { "prettier" },
	-- 		markdown = { "prettier" },
	-- 		svelte = { "prettier" },
	-- 		graphql = { "prettier" },
	-- 		c = { "clang_format" },
	-- 		cpp = { "clang_format" },
	-- 		go = { "gofmt" },
	-- 		lua = { "stylua" },
	-- 		sh = { "shfmt" },
	--      python = { "isort", "black" },
	-- 		-- terraform = { "terraform_fmt" },
	--      -- ansible = { "ansible" },
	-- 	},
	-- 	-- format_on_save = {
	-- 	-- 	timeout_ms = 500,
	-- 	-- 	async = false,
	-- 	-- 	lsp_fallback = true,
	-- 	-- },
	-- },
}
