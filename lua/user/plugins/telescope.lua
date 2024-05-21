return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = " 🔎 ",
				selection_caret = "❯ ",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.80,
					height = 0.90,
					preview_cutoff = 120,
					horizontal = {
						prompt_position = "top",
						preview_width = 0.60,
					},
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
				-- file_sorter = require("telescope.sorters").get_fuzzy_file,
				-- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				file_ignore_patterns = { ".git/", "node_modules/", "target/", "docs/", ".settings/" },
				path_display = { "smart" },
				-- winblend = 0,
				-- border = {},
				-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				-- color_devicons = true,
				-- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				-- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					i = {
						["<C-c>"] = actions.close, -- ESC
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["<esc>"] = actions.close,
						["q"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["gg"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["G"] = actions.move_to_bottom,
						["?"] = actions.which_key,
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here
				find_files = {
					hidden = true,
				},
				live_grep = {
					-- @usage don't include the filename in the search results
					only_sort_text = true,
				},
				grep_string = {
					only_sort_text = true,
				},
				planets = {
					show_pluto = true,
					show_moon = true,
				},
				git_files = {
					hidden = true,
					show_untracked = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				-- Extension configuration goes here
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
					find_cmd = "rg", -- find command (defaults to "fd")
				},
			},
		})

		telescope.load_extension("fzf")
		-- telescope.load_extension("media_files")
		-- telescope.load_extension("projects")
	end,
}
