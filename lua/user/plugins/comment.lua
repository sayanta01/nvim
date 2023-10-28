return {
	"numToStr/Comment.nvim",
	event = "User FileOpened",
	keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")

		comment.setup({
			pre_hook = function(ctx)
				local U = require("Comment.utils")

				local location = nil
				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
					extra = {
						-- Comment on the line above
						above = "gcO",
						-- Comment on the line below
						below = "gco",
						-- Comment at the end of line
						eol = "gcA",
					},
				})
			end,
		})
	end,
}
