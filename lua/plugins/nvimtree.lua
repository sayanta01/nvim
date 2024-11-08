return {
	-- g?
	"nvim-tree/nvim-tree.lua",
	version = "*",
	cmd = "NvimTreeToggle",
	config = function()
		local nvimtree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			on_attach = "default",
			hijack_cursor = true,
			auto_reload_on_write = false,
			disable_netrw = true,
			sync_root_with_cwd = true,
			view = {
				width = 30,
			},
			renderer = {
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
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
						bookmark = "",
						folder = {
							arrow_closed = "❭",
							arrow_open = "⌄",
							default = "",
							open = "",
							empty = "",
							empty_open = "󰜌",
							symlink = "󰌷",
							symlink_open = "󰴛",
						},
						git = {
							unstaged = "∼",
							staged = "",
							unmerged = "",
							renamed = "✎",
							untracked = "∪",
							deleted = "—",
							ignored = "⁄",
						},
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			filters = {
				dotfiles = false,
				custom = { ".DS_Store", ".git", "node_modules", ".cache" },
			},
			trash = {
				cmd = "gio trash",
				require_confirm = true,
			},
		})
	end,
}
