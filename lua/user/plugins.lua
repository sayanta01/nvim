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
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/popup.nvim",
	"nvim-lualine/lualine.nvim",
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
	"goolord/alpha-nvim",
	"lewis6991/gitsigns.nvim",
	"akinsho/toggleterm.nvim",
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 400
		end,
	},
	"kyazdani42/nvim-tree.lua",
	"RRethy/vim-illuminate",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"lukas-reineke/indent-blankline.nvim",
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
	},
	"numToStr/Comment.nvim",
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
	"windwp/nvim-autopairs", -- Autopairs, integrates with cmp & treesitter
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	"kylechui/nvim-surround",
	"akinsho/bufferline.nvim",
	"NvChad/nvim-colorizer.lua",
	"uga-rosa/ccc.nvim",
	--[[ { ]]
	--[[ 	"echasnovski/mini.indentscope", ]]
	--[[ 	-- goto_top = [i ]]
	--[[ 	-- goto_bottom = ]i ]]
	--[[ 	version = false, -- wait till new 0.7.0 release to put it back on semver ]]
	--[[ 	event = { "BufReadPre", "BufNewFile" }, ]]
	--[[ 	opts = { ]]
	--[[ 		symbol = "▏", ]]
	--[[ 		options = { try_as_border = true }, ]]
	--[[ 	}, ]]
	--[[ 	init = function() ]]
	--[[ 		vim.api.nvim_create_autocmd("FileType", { ]]
	--[[ 			pattern = { "help", "alpha", "lazy", "NvimTree", "text" }, ]]
	--[[ 			callback = function() ]]
	--[[ 				vim.b.miniindentscope_disable = true ]]
	--[[ 			end, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ 	config = function(_, opts) ]]
	--[[ 		require("mini.indentscope").setup(opts) ]]
	--[[ 	end, ]]
	--[[ }, ]]
	"ahmedkhalf/project.nvim",
	--[[ { ]]
	--[[ 	"CRAG666/code_runner.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("code_runner").setup({ ]]
	--[[ 			filetype = { ]]
	--[[ 				java = "cd $dir && javac $fileName && java $fileNameWithoutExt", ]]
	--[[ 				python = "python3 -u", ]]
	--[[ 				typescript = "deno run", ]]
	--[[ 				rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt", ]]
	--[[ 			}, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ }, ]]

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
	--[[ { "catppuccin/nvim", name = "catppuccin" }, ]]
	--[[ "B4mbus/oxocarbon-lua.nvim", ]]
	--[[ "Mofiqul/vscode.nvim", ]]
	--[[ "projekt0n/github-nvim-theme", ]]
	--[[ "tiagovla/tokyodark.nvim", ]]
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
	"folke/tokyonight.nvim",
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
	"lunarvim/synthwave84.nvim",
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},

	-- Cmp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-calc",
	--[[ "hrsh7th/cmp-nvim-lsp-signature-help",  -- uncmt in cmp config ]]

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	"jose-elias-alvarez/typescript.nvim",
	--[[ "simrat39/rust-tools.nvim", ]]
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
	},

	-- Debugger
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	--[[ "rcarriga/nvim-dap-ui", ]]
	--[[ "theHamsta/nvim-dap-virtual-text", ]]
	--[[ "mfussenegger/nvim-dap-python", ]]
	-- "leoluz/nvim-dap-go", ]]
})
