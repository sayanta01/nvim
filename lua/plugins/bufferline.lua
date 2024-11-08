return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	keys = {
		{ "<S-Left>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer to Left" },
		{ "<S-Right>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer to Right" },
	},
	opts = {
		options = {
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = false,
			modified_icon = "",
			left_trunc_marker = "‹",
			right_trunc_marker = "›",
			offsets = {
				{
					filetype = "undotree",
					text = "Undo",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "PanelHeading",
					padding = 1,
				},
			},
			separator_style = "thin",
			always_show_bufferline = false,
		},
	},
}
