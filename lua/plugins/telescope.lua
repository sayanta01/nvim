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
			enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
			build = vim.fn.executable("make") == 1 and "make"
				or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
					prompt_position = "top",
					horizontal = { preview_width = 0.6 },
				},
				vimgrep_arguments = {
					"rg",
					"-L",
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
						["<C-t>"] = actions.select_tab,
					},
					n = {
						["q"] = actions.close,
						-- ["dd"] = actions.delete_buffer,
					},
				},
			},
			pickers = {
				find_files = { hidden = true },
				live_grep = { only_sort_text = true },
				grep_string = { only_sort_text = true },
				planets = { show_pluto = true, show_moon = true },
				git_files = { hidden = true, show_untracked = true },
				colorscheme = { enable_preview = true },
			},
		})

		telescope.load_extension("fzf")
	end,
}
