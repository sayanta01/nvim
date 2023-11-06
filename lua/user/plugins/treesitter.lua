return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		dependencies = {
			--[[ "nvim-treesitter/nvim-treesitter-textobjects", ]]
			--[[ "windwp/nvim-ts-autotag", ]]
			"hiphish/rainbow-delimiters.nvim",
		},
		config = function()
			-- import treesitter
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({ -- enable syntax highlighting
				--[[ ensure_installed = "all", ]]
				ensure_installed = {
					"c",
					--[[ "cpp", ]]
					--[[ "c_sharp", ]]
					"python",
					"bash",
					"json",
					"lua",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"php",
					"sql",
					"go",
					"rust",
					"markdown",
					"markdown_inline",
					"java",
					"dockerfile",
					"gitignore",
					"vim",
					"regex",

					"svelte",
					--[[ "astro", ]]
					--[[ "kotlin", ]]
					--[[ "ruby", ]]

					"yaml",
					"graphql",
					--[[ "prisma", ]]
				},
				sync_install = false,
				-- List of parsers to ignore installing (or "all")
				ignore_install = {},
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
				--[[ autotag = { enable = true }, -- for autotag plugin ]]

				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				context_commentstring = {
					enable = true,
					--[[ enable_autocmd = false, ]]
				},
			})
		end,
	},
}
