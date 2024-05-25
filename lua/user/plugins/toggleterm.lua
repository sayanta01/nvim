return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = { "<C-/>" },
	opts = {
		size = 20,
		open_mapping = [[<C-/>]],
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 20,
		},
	},
}
