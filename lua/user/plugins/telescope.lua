return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		--[[ { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true }, ]]
		"ThePrimeagen/harpoon",
		{
			"ThePrimeagen/refactoring.nvim",
			config = function()
				require("refactoring").setup({
					prompt_func_return_type = {
						go = false,
						java = false,

						cpp = false,
						c = false,
						h = false,
						hpp = false,
						cxx = false,
					},
					prompt_func_param_type = {
						go = false,
						java = false,

						cpp = false,
						c = false,
						h = false,
						hpp = false,
						cxx = false,
					},
					printf_statements = {},
					print_var_statements = {},
				})
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = "❯ ",
				--[[ prompt_prefix = "   ", ]]
				--[[ selection_caret = "|> ", ]]
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				--[[ sorting_strategy = "descending", ]]
				--[[ layout_strategy = "horizontal", ]]
				layout_config = {
					width = 0.80,
					preview_cutoff = 120,
					horizontal = {
						preview_width = function(_, cols, _)
							if cols < 120 then
								return math.floor(cols * 0.5)
							end
							return math.floor(cols * 0.6)
						end,
						mirror = false,
					},
					vertical = { mirror = false },
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
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { ".git/", "node_modules/", "target/", "docs/", ".settings/" },
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "smart" },
				winblend = 0,
				--[[ border = {}, ]]
				--[[ borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, ]]
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-c>"] = actions.close, -- ESC
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
					},
					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						["?"] = actions.which_key,
					},
				},
			},
			file_ignore_patterns = {},
			pickers = {
				-- Default configuration for builtin pickers goes here
				find_files = {
					hidden = true,
				},
				live_grep = {
					--[[ @usage don't include the filename in the search results ]]
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
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
					find_cmd = "rg", -- find command ( defaults to "fd" )
				},
				--[[ fzf = { ]]
				--[[ 	fuzzy = true, -- false will only do exact matching ]]
				--[[ 	override_generic_sorter = true, -- override the generic sorter ]]
				--[[ 	override_file_sorter = true, -- override the file sorter ]]
				--[[ 	case_mode = "smart_case", -- or "ignore_case" or "respect_case" ]]
				--[[ }, ]]
			},
		})

		--[[ telescope.load_extension("media_files") ]]
		telescope.load_extension("projects")
		-- telescope.load_extension("fzf")
	end,
}
