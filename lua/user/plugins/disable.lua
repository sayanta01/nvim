return {
	-- {
	-- 	"akinsho/flutter-tools.nvim",
	-- 	enabled = true,
	-- 	ft = "dart",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = true,
	-- },

	-- {
	-- 	"nvim-cmp",
	-- 	dependencies = {
	-- 		{
	-- 			"Exafunction/codeium.nvim",
	-- 			enabled = true,
	-- 			build = ":Codeium Auth",
	-- 			opts = {},
	-- 		},
	-- 	},
	-- },

	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				text = {
					loading = "   Loading",
					version = "   %s",
					prerelease = "   %s",
					yanked = "  󰆏 %s",
					nomatch = "   No match",
					upgrade = "   %s",
					error = "   Error fetching crate",
				},
				popup = {
					text = {
						title = " %s",
						pill_left = "",
						pill_right = "",
						description = "%s",
						created_label = " created        ",
						created = "%s",
						updated_label = " updated        ",
						updated = "%s",
						downloads_label = " downloads      ",
						downloads = "%s",
						homepage_label = " homepage       ",
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
						prerelease = " %s",
						yanked = "󰆏 %s",
						version_date = "  %s",
						feature = "  %s",
						enabled = " %s",
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
						prerelease = "  pre-release ",
						yanked = " 󰆏 yanked ",
					},
					cmp = {
						enabled = true,
					},
				},
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
}
