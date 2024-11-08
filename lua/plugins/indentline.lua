return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "InsertEnter", "BufWritePost" },
	opts = {
		indent = { char = "▏" },
		scope = { enabled = true, show_start = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"NvimTree",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
			},
		},
	},
}
