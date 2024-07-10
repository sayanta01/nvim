return {
	"3rd/image.nvim",
	ft = { "markdown", "conf" },
	dependencies = {
		{
			"vhyrro/luarocks.nvim",
			priority = 1001,
			opts = {
				rocks = { "magick" },
			},
		},
	},
	opts = {
		backend = "kitty",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = true,
				only_render_image_at_cursor = true,
				filetypes = { "markdown", "conf" },
			},
		},
		max_width_window_percentage = nil,
		max_height_window_percentage = 80,
		editor_only_render_when_focused = false,
		tmux_show_only_in_active_window = true,
	},
}
