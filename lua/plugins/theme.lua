return {
	-- {
	-- 	"bluz71/vim-nightfly-colors",
	-- 	name = "nightfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme nightfly")
	-- 	end,
	-- },

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
		},
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},

	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },

	-- {
	-- 	"RRethy/nvim-base16",
	-- 	lazy = false,
	-- },
}
