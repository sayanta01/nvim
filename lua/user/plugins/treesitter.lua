return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
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
				ignore_install = {},
				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = true,
				},
				indent = { enable = true, disable = { "yaml" } },
				--[[ autotag = { enable = true }, -- for autotag plugin ]]

				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	},
}
