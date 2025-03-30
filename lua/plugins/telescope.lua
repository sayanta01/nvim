return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>f", ":Telescope find_files cwd=%:p:h<cr>", desc = "Find Files" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = " 🔭 ",
				selection_caret = "❯ ",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.52,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				file_ignore_patterns = { "node_modules" },
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
					},
					n = {
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				live_grep = { only_sort_text = true },
				grep_string = { only_sort_text = true },
				planets = { show_pluto = true, show_moon = true },
				colorscheme = { enable_preview = true },
			},
		})

		telescope.load_extension("fzf")
	end,
}
