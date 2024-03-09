return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSModuleInfo" },
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({ -- enable syntax highlighting
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"diff",
					"regex",
					"gitignore",
					"bash",
					"python",
					"json",
					"jsonc",
					"toml",
					"yaml",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"php",
					"sql",
					"markdown",
					"markdown_inline",
					"rust",
					"go",
					"java",
					"dockerfile",
					"svelte",
					"graphql",
					-- "prisma",
				},
				sync_install = false,
				-- auto_install = true, -- must have `tree-sitter` CLI installed locally
				-- ignore_install = {}, -- List of parsers to ignore installing (or `all`)
				highlight = {
					enable = true,
					-- disable = { "latex" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(_, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autotag = { enable = false }, -- for autotag plugin
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},

				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				ts_context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	},
}
