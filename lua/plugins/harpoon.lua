return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		settings = { save_on_toggle = true },
	},
	keys = function()
		local keys = {
			{ "<leader>H", function() require("harpoon"):list():add() end },
			{
				"<leader>h",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Menu",
			},
		}

		for i = 1, 5 do
			table.insert(keys, {
				"<leader>" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
			})
		end
		return keys
	end,
}
