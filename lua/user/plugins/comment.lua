return {
	"numToStr/Comment.nvim",
	keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- enable_autocmd = false,
			pre_hook = ts_context_commentstring.create_pre_hook(), -- for commenting tsx and jsx files
		})
	end,
}
