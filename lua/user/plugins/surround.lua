return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	keys = { "cs", "ds", "ys" },
	config = function()
		require("nvim-surround").setup({
			-- use {['"( left side surround to add space
			keymaps = {
				--[[ insert = "<C-g>s", ]]
				--[[ insert_line = "<C-g>S", ]]
				--[[ normal = "ys", ]]
				--[[ normal_cur = "yss", ]]
				--[[ normal_line = "yS", ]]
				--[[ normal_cur_line = "ySS", ]]
				--[[ visual = "S", ]]
				--[[ visual_line = "gS", ]]
				delete = "ds",
				change = "cs", -- cst <change tags>
				--[[ change_line = "cS", ]]
			},
		})
	end,
}
