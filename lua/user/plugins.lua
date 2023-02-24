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

-- notify config
local BUILTIN_STAGES = {
	fade_IN_SLIDE_OUT = "fade_in_slide_out", -- fade, slide, static
}
local BUILTIN_RENDERERS = {
	DEFAULT = "compact", -- minimal, compact, simple
}

require("lazy").setup({
	-- Dependences
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	--[[ "kyazdani42/nvim-web-devicons", ]]
	"nvim-tree/nvim-web-devicons",
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				timeout = 2900,
				level = vim.log.levels.INFO,
				fps = 40,
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
				stages = BUILTIN_STAGES.FADE_IN_SLIDE_OUT,
				render = BUILTIN_RENDERERS.DEFAULT,
				max_width = nil,
				max_height = nil,
				--[[ max_height = function() ]]
				--[[ 	return math.floor(vim.o.lines * 0.75) ]]
				--[[ end, ]]
				--[[ max_width = function() ]]
				--[[ 	return math.floor(vim.o.columns * 0.75) ]]
				--[[ end, ]]
			})
		end,
	},
	-- Features
	"lewis6991/gitsigns.nvim",
	"akinsho/toggleterm.nvim",
	"NvChad/nvim-colorizer.lua",
	"uga-rosa/ccc.nvim",
	"folke/zen-mode.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"nvim-lualine/lualine.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"akinsho/bufferline.nvim",
	"kylechui/nvim-surround",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"ahmedkhalf/project.nvim",
	"goolord/alpha-nvim",
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
	"windwp/nvim-autopairs", -- Autopairs, integrates with cmp & treesitter
	"RRethy/vim-illuminate",
	"folke/which-key.nvim",
	"kyazdani42/nvim-tree.lua",
	"ThePrimeagen/vim-be-good",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" }, -- Fix this

	-- Themes
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- config goes here
		end,
	},
	"sainnhe/edge",
	"rebelot/kanagawa.nvim",
	"Shatur/neovim-ayu",
	"arcticicestudio/nord-vim",
	{ "Everblush/nvim", name = "everblush" },
	{ "catppuccin/nvim", name = "catppuccin" },
	"tiagovla/tokyodark.nvim",
	"B4mbus/oxocarbon-lua.nvim",
	"sainnhe/gruvbox-material",
	"Mofiqul/vscode.nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup()
		end,
	},
	"LunarVim/darkplus.nvim",
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	"folke/tokyonight.nvim",
	"lunarvim/synthwave84.nvim",

	-- Cmp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-calc",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jay-babu/mason-null-ls.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-nvim-dap.nvim",
	"jose-elias-alvarez/typescript.nvim",
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	--[[ { ]]
	--[[ 	"glepnir/lspsaga.nvim", ]]
	--[[ 	event = "BufRead", ]]
	--[[ }, ]]

	-- Debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"mfussenegger/nvim-dap-python",
	"mfussenegger/nvim-jdtls",
	"simrat39/rust-tools.nvim",
	--[[ "leoluz/nvim-dap-go", ]]
	--[[ "mxsdev/nvim-dap-vscode-js", ]]
})
