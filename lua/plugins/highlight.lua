return {
	"brenoprata10/nvim-highlight-colors",
	keys = {
		{
			"<leader>uh",
			function()
				local hc = require("nvim-highlight-colors")
				if hc.is_on then
					hc.turnOff()
				else
					hc.turnOn()
				end
				hc.is_on = not hc.is_on
			end,
			desc = "Highlight Colors",
		},
	},
	opts = {
		render = "virtual",
		enable_tailwind = true,
	},
}
