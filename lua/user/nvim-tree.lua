local present, nvimtree = pcall(require, "nvim-tree")
if not present then
	return
end

local options = {
	filters = {
		dotfiles = false,
		exclude = { "custom" },
	},
	disable_netrw = false,
	hijack_cursor = true,
	hijack_netrw = false,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
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
		width = 28,
		--height = 28,
		hide_root_folder = false,
		side = "left",
		number = false,
	},
	git = {
		enable = false,
		ignore = true,
		timeout = 200,
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
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
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "|",
				item = "|",
				bottom = "─",
				none = " ",
			},
		},

		icons = {
			padding = " ",
			symlink_arrow = " -> ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "",
					staged = " ",
					unmerged = "",
					renamed = "-> ",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}

nvimtree.setup(options)
