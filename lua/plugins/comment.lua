return {
	"numToStr/Comment.nvim",
	keys = {
		{ "<leader>/", "gcc", mode = { "n" }, remap = true, desc = "Toggle Comment" },
		{ "<leader>/", "gc", mode = { "v" }, remap = true, desc = "Toggle Comment" },
	},
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			enable_autocmd = false,
			pre_hook = ts_context_commentstring.create_pre_hook(), -- comment tsx/jsx files
		})
	end,
}
