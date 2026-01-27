return {
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true },
		},
	},

	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- 	event = function()
	-- 		if vim.fn.exists("$TMUX") == 1 then
	-- 			return "VeryLazy"
	-- 		end
	-- 	end,
	-- },
}
