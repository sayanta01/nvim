return {
	"brenoprata10/nvim-highlight-colors",
	keys = {
		{
			"<leader>oh",
			function()
				local hc = require("nvim-highlight-colors")
				if hc.is_on then
					hc.turnOff()
				else
					hc.turnOn()
				end
				hc.is_on = not hc.is_on
			end,
			desc = "Toggle Color",
		},
	},
	opts = {
		render = "virtual",
		virtual_symbol = "■",
		virtual_symbol_position = "eol",
		enable_tailwind = true,
	},
}
