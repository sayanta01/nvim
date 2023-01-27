local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Dependences
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"kyazdani42/nvim-web-devicons",
	"rcarriga/nvim-notify",
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	--[[ "antoinemadec/FixCursorHold.nvim", ]]
	--[[ "moll/vim-bbye", ]]

	-- Feature
	"lewis6991/gitsigns.nvim",
	"akinsho/toggleterm.nvim",
	"norcalli/nvim-colorizer.lua",
	"uga-rosa/ccc.nvim",
	"folke/zen-mode.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",

	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	--[[ { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, ]]
	"ahmedkhalf/project.nvim",
	"goolord/alpha-nvim",

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
	{
		"mrjones2014/nvim-ts-rainbow",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {},
				rainbow = {
					enable = true,
					--[[ disable = { "jsx", "cpp" }, ]]
					extended_mode = true,
					max_file_lines = 999,
					-- colors = {}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
			})
		end,
	},
	"numToStr/Comment.nvim",
	"akinsho/bufferline.nvim",
	"windwp/nvim-autopairs", -- Autopairs, integrates with cmp & treesitter
	"nvim-lualine/lualine.nvim",
	"RRethy/vim-illuminate",

	"folke/which-key.nvim",
	"kyazdani42/nvim-tree.lua",

	-- Extra
	"ThePrimeagen/vim-be-good",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Themes
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- your optional config goes here
		end,
	},
	"tiagovla/tokyodark.nvim",
	"B4mbus/oxocarbon-lua.nvim",
	--[[ "sainnhe/gruvbox-material", ]]
	"morhetz/gruvbox",
	"rose-pine/neovim",
	"LunarVim/darkplus.nvim",
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	"catppuccin/nvim",
	"folke/tokyonight.nvim",

	-- Cmp plugins
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-calc",
	"f3fora/cmp-spell",
	--[[ "hrsh7th/cmp-cmdline", ]]

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	"jose-elias-alvarez/typescript.nvim",

	-- Debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"ravenxrz/DAPInstall.nvim",
	"theHamsta/nvim-dap-virtual-text",
	--[[ { ]]
	--[[ 	"theHamsta/nvim-dap-virtual-text", ]]
	--[[ 	config = function() ]]
	--[[ 		require("nvim-dap-virtual-text").setup() ]]
	--[[ 	end, ]]
	--[[ }, ]]
	"mfussenegger/nvim-dap-python",
})
