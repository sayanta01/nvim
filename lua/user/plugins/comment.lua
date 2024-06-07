return {
	"numToStr/Comment.nvim",
	keys = { { "<leader>/" }, { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			enable_autocmd = false,
			pre_hook = ts_context_commentstring.create_pre_hook(), -- commenting tsx & jsx
		})
	end,
}
