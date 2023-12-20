return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	cmd = "NvimTreeToggle",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			filters = {
				dotfiles = false,
			},
			hijack_netrw = false,
			hijack_unnamed_buffer_when_opening = false,
			update_focused_file = {
				enable = true,
				update_cwd = false,
				ignore_list = {},
			},
			hijack_directories = {
				enable = false,
				auto_open = true,
			},
			diagnostics = {
				enable = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 29,
				side = "left",
				number = false,
			},
			git = {
				enable = false,
				ignore = true,
				timeout = 200,
			},
			system_open = {
				cmd = "",
				args = {},
			},
			trash = {
				cmd = "gio trash",
				require_confirm = true,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
					window_picker = {
						enable = false,
					},
				},
			},
			renderer = {
				highlight_git = false,
				highlight_opened_files = "none",
				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "|",
						edge = "|",
						item = "|",
						bottom = "󰍴",
						none = " ",
					},
				},
				icons = {
					padding = " ",
					symlink_arrow = "  ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = " ",
							unmerged = "",
							renamed = "",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})
	end,
}
