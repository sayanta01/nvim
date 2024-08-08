return {
	"kylechui/nvim-surround",
	version = "*",
	keys = { "ys", "ds", "cs" }, -- ysiw" new word
	config = function()
		require("nvim-surround").setup({
			-- use {[( left parenthesis adds space
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
				change = "cs", -- use t for <tag>
				change_line = "cS",
			},
		})
	end,
}
