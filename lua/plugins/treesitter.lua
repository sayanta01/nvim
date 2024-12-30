return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<C-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"dockerfile",
					"java",
					"bash",
					"python",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"svelte",
					"graphql",
					"jsonc",
					"yaml",
				},
				auto_install = vim.fn.executable("git") == 1 and vim.fn.executable("tree-sitter") == 1,
				highlight = {
					enable = true,
					disable = function(_, buf)
						local max_filesize = 1024 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"jsx",
			"tsx",
			"vue",
			"svelte",
			"xml",
			"php",
			"twig",
			"markdown",
			"astro",
		},
	},
}