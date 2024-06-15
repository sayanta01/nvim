return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<S-Left>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer to Left" },
		{ "<S-Right>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer to Right" },
	},
	opts = {
		options = {
			-- close_command = "bdelete! %d",
			-- left_mouse_command = "buffer %d",
			-- middle_mouse_command = nil,
			-- right_mouse_command = "bdelete! %d",
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = false,
			modified_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			diagnostics = false,
			diagnostics_update_in_insert = false,
			offsets = {
				{
					filetype = "undotree",
					text = "Undo",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "NvimTree",
					text = "Files",
					highlight = "PanelHeading",
					padding = 1,
				},
			},
			separator_style = "thin",
			always_show_bufferline = false,
		},
	},
}
