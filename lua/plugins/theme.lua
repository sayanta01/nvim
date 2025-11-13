return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = { style = "moon" },
	-- 	config = function()
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },

	-- {
	--   "rose-pine/neovim",
	--   name = "rose-pine",
	--   config = function()
	--     vim.cmd.colorscheme("rose-pine")
	--   end,
	-- },

	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nightfly")
		end,
	},

	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("nord")
	-- 	end,
	-- },
}
