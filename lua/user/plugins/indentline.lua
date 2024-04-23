return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "InsertEnter", "BufWritePost" },
	opts = {
		indent = {
			char = "▏",
			tab_char = "▏",
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = { enabled = true, show_start = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
        "NvimTree",
				"neo-tree",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"Trouble",
				"trouble",
			},
		},
	},
}
