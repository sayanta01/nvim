return {
	"kylechui/nvim-surround",
	keys = { "cs", "ds", "ys" }, -- ys<w> add new word
	config = function()
		require("nvim-surround").setup({
			-- use [{( left side surround to add space
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
