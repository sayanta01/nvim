return {
	"rose-pine/neovim",
	name = "rose-pine",
	dependencies = {
		-- "lunarvim/lunar.nvim",
		-- "B4mbus/oxocarbon-lua.nvim",
		-- {
		-- 	"olimorris/onedarkpro.nvim",
		-- 	priority = 1000, -- Ensure it loads first
		-- },
		-- "RRethy/nvim-base16",
		-- "lunarvim/synthwave84.nvim",
		-- "sainnhe/gruvbox-material",
		{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	},
	lazy = true,
}
