return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",

	config = function()
		local highlight = {
			-- "CursorColumn",
			"Whitespace",
		}
		require("ibl").setup({
			-- ▏ ┆ ╎ : ∘
			indent = { highlight = highlight, char = "" },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = { enabled = true, show_start = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"lazy",
					"mason",
					"toggleterm",
				},
			},
		})
	end,
}
