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

-- Notify config
local BUILTIN_STAGES = {
	fade_IN_SLIDE_OUT = "fade_in_slide_out", -- fade, slide, static
}
local BUILTIN_RENDERERS = {
	DEFAULT = "compact", -- minimal, compact, simple
}

require("lazy").setup({
	-- Dependences
	"nvim-lua/popup.nvim",
	{ "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				timeout = 2000,
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
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	"akinsho/toggleterm.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 299
		end,
	},
	"kyazdani42/nvim-tree.lua",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
	},
	--[[ { ]]
	--[[ 	"HiPhish/nvim-ts-rainbow2", ]]
	--[[ 	config = function() ]]
	--[[ 		require("nvim-treesitter.configs").setup({ ]]
	--[[ 			highlight = {}, ]]
	--[[ 			rainbow = { ]]
	--[[ 				enable = true, ]]
	--[[ 				-- disable = { "jsx", "cpp" }, ]]
	--[[ 				extended_mode = true, ]]
	--[[ 				max_file_lines = 999, ]]
	--[[ 				-- colors = {}, -- table of hex strings ]]
	--[[ 				-- termcolors = {} -- table of colour name strings ]]
	--[[ 			}, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ }, ]]
	{
		"windwp/nvim-autopairs", -- autopairs, integrates with cmp & treesitter
		event = "InsertEnter",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
	},
	{
		"akinsho/bufferline.nvim",
		branch = "main",
	},
	"NvChad/nvim-colorizer.lua",
	"uga-rosa/ccc.nvim",
	{
		"RRethy/vim-illuminate",
		event = { "VeryLazy", "LspAttach" },
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
	},

	-- Misc
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
	--[[ { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, ]]
	--[[ "B4mbus/oxocarbon-lua.nvim", ]]
	--[[ "Mofiqul/vscode.nvim", ]]
	--[[ "projekt0n/github-nvim-theme", ]]
	--[[ "tiagovla/tokyodark.nvim", ]]
	--[[ "lunarvim/synthwave84.nvim", ]]
	--[[ { ]]
	--[[ 	"uloco/bluloco.nvim", ]]
	--[[ 	lazy = false, ]]
	--[[ 	priority = 1000, ]]
	--[[ 	dependencies = { "rktjmp/lush.nvim" }, ]]
	--[[ 	config = function() ]]
	--[[ 		-- config goes here ]]
	--[[ 	end, ]]
	--[[ }, ]]
	"sainnhe/gruvbox-material",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup()
		end,
	},
	"RRethy/nvim-base16",
	"lunarvim/lunar.nvim",
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- ensure it loads first
	},

	-- Cmp
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	"f3fora/cmp-spell",
	"hrsh7th/cmp-calc",

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- LSP
	"williamboman/mason.nvim",
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},
	"jay-babu/mason-null-ls.nvim",
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
	},
	{
		"b0o/schemastore.nvim",
		version = false, -- last release is way too old
		lazy = true,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		config = function(_, opts)
			require("typescript").setup(opts)
		end,
	},

	-- Debugger
	"mfussenegger/nvim-dap",
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = function()
			local path = require("mason-registry").get_package("debugpy"):get_install_path()
			require("dap-python").setup(path .. "/venv/bin/python")
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		ft = "python",
		cmd = "VenvSelect",
		opts = {},
		keys = {
			{
				"<leader>vs",
				"<cmd>:VenvSelect<cr>",
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
})
