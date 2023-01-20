local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"kyazdani42/nvim-web-devicons",
	"antoinemadec/FixCursorHold.nvim",
	"moll/vim-bbye",
	"lewis6991/impatient.nvim",

	"goolord/alpha-nvim",
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs", -- Autopairs, integrates with cmp & treesitter
	"nvim-lualine/lualine.nvim",
	"ahmedkhalf/project.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"akinsho/bufferline.nvim",
	"akinsho/toggleterm.nvim",
	"kyazdani42/nvim-tree.lua",
	"folke/which-key.nvim",
	"ThePrimeagen/vim-be-good",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	--[[ { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, ]]

	-- Themes
	"morhetz/gruvbox",
	"rose-pine/neovim",
	"LunarVim/darkplus.nvim",
	"LunarVim/onedarker.nvim",
	"folke/tokyonight.nvim",
	"p00f/nvim-ts-rainbow",
	"folke/zen-mode.nvim",
	"norcalli/nvim-colorizer.lua",
	"uga-rosa/ccc.nvim",

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Cmp plugins
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-calc",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-cmdline",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"VonHeikemen/lsp-zero.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"RRethy/vim-illuminate",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- DAP
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"ravenxrz/DAPInstall.nvim",
	"mfussenegger/nvim-dap-python",

	-- Git
	"lewis6991/gitsigns.nvim",
})
