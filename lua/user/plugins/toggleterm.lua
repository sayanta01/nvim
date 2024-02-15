return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = { "<A-\\>" },
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<A-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 0.9,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 20,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		local terminal = require("toggleterm.terminal").Terminal
		local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		local node = terminal:new({ cmd = "node", hidden = true })
		function _NODE_TOGGLE()
			node:toggle()
		end

		local python = terminal:new({ cmd = "python", hidden = true })
		function _PYTHON_TOGGLE()
			python:toggle()
		end
	end,
}
