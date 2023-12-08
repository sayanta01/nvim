return {
	"numToStr/Comment.nvim",
	event = "User FileOpened",
	keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("Comment").setup({
			-- for commenting tsx and jsx files
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
