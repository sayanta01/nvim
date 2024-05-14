return {
	{
		"LunarVim/bigfile.nvim",
		event = "BufReadPre",
		opts = {
			filesize = 2,
			pattern = { "*" },
			features = {
				-- "lsp",
				"treesitter",
				"filetype",
				-- "syntax",
			},
		},
	},

	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Up" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Down" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"ThePrimeagen/harpoon",
		lazy = true,
		config = true,
	},

	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				text = {
					loading = "   Loading",
					version = "   %s",
					prerelease = "   %s",
					yanked = "   %s",
					nomatch = "   No match",
					upgrade = "   %s",
					error = "   Error fetching crate",
				},
				popup = {
					-- autofocus = false,
					-- hide_on_select = false,
					-- copy_register = '"',
					-- style = "minimal",
					-- border = "none",
					-- show_version_date = false,
					-- show_dependency_version = true,
					-- max_height = 30,
					-- min_width = 20,
					-- padding = 1,
					text = {
						title = " %s",
						pill_left = "",
						pill_right = "",
						description = "%s",
						created_label = " created        ",
						created = "%s",
						updated_label = " updated        ",
						updated = "%s",
						downloads_label = " downloads      ",
						downloads = "%s",
						homepage_label = " homepage       ",
						homepage = "%s",
						repository_label = " repository     ",
						repository = "%s",
						documentation_label = " documentation  ",
						documentation = "%s",
						crates_io_label = " crates.io      ",
						crates_io = "%s",
						categories_label = " categories     ",
						keywords_label = " keywords       ",
						version = "  %s",
						prerelease = "󰈅 %s",
						yanked = " %s",
						version_date = "  %s",
						feature = "  %s",
						enabled = "󰨚 %s",
						transitive = " %s",
						normal_dependencies_title = " Dependencies",
						build_dependencies_title = " Build dependencies",
						dev_dependencies_title = " Dev dependencies",
						dependency = "  %s",
						optional = " %s",
						dependency_version = "  %s",
						loading = "  ",
					},
				},
				src = {
					text = {
						prerelease = " 󰈅 pre-release ",
						yanked = "  yanked ",
					},
					cmp = {
						enabled = true,
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
			"javascriptreact",
			"typescriptreact",
			"tsx",
			"jsx",
      "vue",
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

	-- {
	-- 	"linux-cultist/venv-selector.nvim",
	-- 	cmd = { "VenvSelect", "VenvSelectCached" },
	-- 	opts = {
	-- 		name = {
	-- 			"venv",
	-- 			".venv",
	-- 			"env",
	-- 			".env",
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>vs", "<cmd>VenvSelect<cr>", ft = "python" },
	-- 		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", ft = "python" },
	-- 	},
	-- },

	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
		lazy = true,
	},

	-- Misc --
	-- {
	-- 	"ThePrimeagen/vim-be-good",
	-- 	cmd = "VimBeGood",
	-- },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		event = function()
			if vim.fn.exists("$TMUX") == 1 then
				return "VeryLazy"
			end
		end,
	},

	-- {
	-- 	"szw/vim-maximizer",
	-- 	keys = {
	-- 		{ "<leader>ms", ":MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	-- 	},
	-- },
}
