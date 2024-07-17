return {
	"akinsho/toggleterm.nvim",
	version = "*",
  -- stylua: ignore
  keys = {
    { "<C-/>",      desc = "Terminal" },
    { "<leader>th", ":ToggleTerm size=14 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
    { "<leader>tv", ":ToggleTerm size=80 direction=vertical<cr>",   desc = "Vertical",   nowait = true, remap = false },
    { "<leader>gg", ":lua _LAZYGIT_TOGGLE()<cr>",                   desc = "Lazygit",    nowait = true, remap = false },
  },
	opts = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "curved",
				winblend = 20,
			},
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		return {
			size = 20,
			open_mapping = [[<C-/>]],
			direction = "float",
			float_opts = {
				border = "curved",
				winblend = 20,
			},
		}
	end,
}
