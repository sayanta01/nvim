return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<C-/>", desc = "Terminal" },
		{ "<leader>th", ":ToggleTerm size=14 direction=horizontal<cr>", desc = "Horizontal" },
		{ "<leader>tv", ":ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
		{ "<leader>gg", ":lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit" },
	},
	opts = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "curved",
			},
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		-- escape terminal mode
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })

		return {
			size = 20,
			open_mapping = [[<C-/>]],
			direction = "float",
			float_opts = {
				border = "curved",
			},
		}
	end,
}
