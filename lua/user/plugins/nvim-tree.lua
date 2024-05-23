return {
	-- g?
	-- o-pen
	-- a-dd
	-- r-ename
	-- d-elete
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
			on_attach = "default",
			hijack_cursor = true,
			auto_reload_on_write = false,
			disable_netrw = true,
			hijack_netrw = true,
			-- hijack_unnamed_buffer_when_opening = false,
			-- root_dirs = {},
			-- prefer_startup_root = false,
			sync_root_with_cwd = true,
			-- reload_on_bufenter = false,
			-- respect_buf_cwd = false,
			-- select_prompts = false,
			-- sort_by = "name",
			view = {
				width = 29,
				side = "left",
			},
			renderer = {
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				highlight_git = true,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "▏",
						edge = "▏",
						item = "▏",
						bottom = "",
						none = " ",
					},
				},
				icons = {
					git_placement = "after",
					symlink_arrow = " 󰌷 ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "󰌷",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "󰜌",
							symlink = "󰌷",
							symlink_open = "󰿨",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "󰲶",
							untracked = "U",
							deleted = "",
							ignored = "",
						},
					},
				},
			},
			hijack_directories = {
				enable = false,
				auto_open = true,
			},
			update_focused_file = {
				enable = true,
				update_root = {
					enable = false,
					ignore_list = {},
				},
			},
			git = {
				enable = true,
			},
			diagnostics = {
				enable = false,
			},
			filters = {
				dotfiles = false,
				custom = { ".DS_Store", ".git", "node_modules", "\\.cache" },
			},
			actions = {
				use_system_clipboard = true,
				open_file = {
					quit_on_open = false,
					resize_window = false,
					window_picker = {
						enable = false,
					},
				},
			},
			trash = {
				cmd = "gio trash",
				require_confirm = true,
			},
		})
	end,
}
