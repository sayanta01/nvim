return {
	"kylechui/nvim-surround",
	version = "*",
	keys = { "cs", "ds", "ys" }, -- ys<w> new word
	config = function()
		require("nvim-surround").setup({
			-- use [{( left parentheses adds space
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "ys",
				normal_cur = "yss", -- entire line
				normal_line = "yS",
				normal_cur_line = "ySS",
				visual = "S",
				visual_line = "gS",
				delete = "ds",
				change = "cs", -- cst <change tag> & dst <delete tag>
				change_line = "cS",
			},
		})
	end,
}
