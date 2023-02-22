local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		numbers = "none",
		close_command = "bdelete! %d",
		middle_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		right_mouse_command = nil,
		show_tab_indicators = true,
		indicator = " ",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		buffer_close_icon = "x",
		modified_icon = "",
		show_close_icon = false,
		-- close_icon = " ",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 28,
		max_prefix_length = 28,
		tab_size = 20,
		diagnostics = false, -- "nvim_lsp",
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
	},
})
