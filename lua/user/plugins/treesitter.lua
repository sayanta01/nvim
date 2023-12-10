return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			--[[ "nvim-treesitter/nvim-treesitter-textobjects", ]]
			"hiphish/rainbow-delimiters.nvim",
		},
		{
			"windwp/nvim-ts-autotag",
			ft = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"tsx",
				"jsx",
				"svelte",
				"xml",
				"php",
				"markdown",
				"astro",
			},
			config = function()
				require("nvim-ts-autotag").setup({
					skip_tags = "",
				})
			end,
		},

		config = function()
			-- import treesitter
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({ -- enable syntax highlighting
				ensure_installed = {
					"c",
					--[[ "cpp", ]]
					--[[ "c_sharp", ]]
					"python",
					"bash",
					"json",
					"yaml",
					"lua",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"php",
					"sql",
					"markdown",
					"markdown_inline",
					"go",
					"rust",
					"java",
					"dockerfile",
					"gitignore",
					"vim",
					"regex",
					"svelte",
					"graphql",
				},
				sync_install = false,
				ignore_install = {}, -- List of parsers to ignore installing (or "all")
				highlight = {
					enable = true,
					disable = { "latex" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					--[[ disable = function(lang, buf) ]]
					--[[ 	local max_filesize = 100 * 1024 -- 100 KB ]]
					--[[ 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf)) ]]
					--[[ 	if ok and stats and stats.size > max_filesize then ]]
					--[[ 		return true ]]
					--[[ 	end ]]
					--[[ end, ]]
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true, disable = { "yaml" } },
				autotag = { enable = false }, -- for autotag plugin

				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				ts_context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	},
}
