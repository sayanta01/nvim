return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = { "<C-/>" },
	cmd = "ToggleTerm",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-/>]],
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
	end,
}
