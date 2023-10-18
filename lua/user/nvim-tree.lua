local present, nvimtree = pcall(require, "nvim-tree")
if not present then
	return
end

--[[ local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config") ]]
--[[ if not config_status_ok then ]]
--[[ 	return ]]
--[[ end ]]

--[[ local tree_cb = nvim_tree_config.nvim_tree_callback ]]

local options = {
	filters = {
		dotfiles = false,
	},
	--[[ disable_netrw = false, ]]
	--[[ hijack_cursor = false, ]]
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
		--[[ mappings = { ]]
		--[[ 	list = { ]]
		--[[ 		{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") }, ]]
		--[[ 		{ key = "h", cb = tree_cb("close_node") }, ]]
		--[[ 		{ key = "v", cb = tree_cb("vsplit") }, ]]
		--[[ 	}, ]]
		--[[ }, ]]
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
				--[[ corner = "└", ]]
				corner = "",
				edge = "",
				item = "",
				bottom = "󰍴",
				none = " ",
			},
		},
		icons = {
			padding = " ",
			symlink_arrow = "",
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
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
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
}

nvimtree.setup(options)
