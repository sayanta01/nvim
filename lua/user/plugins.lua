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
	{ "nvim-lua/plenary.nvim", lazy = true },
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
	{
		"windwp/nvim-autopairs", -- Autopairs, integrates with cmp & treesitter
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
	"akinsho/bufferline.nvim",
	"NvChad/nvim-colorizer.lua",
	"uga-rosa/ccc.nvim",
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
	},
	--[[ { ]]
	--[[ 	"VonHeikemen/fine-cmdline.nvim", ]]
	--[[ 	dependencies = "MunifTanjim/nui.nvim", ]]
	--[[ 	vim.api.nvim_set_keymap("n", ":", ":FineCmdline<CR>", { noremap = true }), ]]
	--[[ 	config = function() ]]
	--[[ 		require("fine-cmdline").setup({ ]]
	--[[ 			cmdline = { ]]
	--[[ 				enable_keymaps = true, ]]
	--[[ 				smart_history = true, ]]
	--[[ 				prompt = "   ", ]]
	--[[ 			}, ]]
	--[[ 			popup = { ]]
	--[[ 				position = { ]]
	--[[ 					row = "20%", ]]
	--[[ 					col = "50%", ]]
	--[[ 				}, ]]
	--[[ 				size = { ]]
	--[[ 					width = "50%", ]]
	--[[ 				}, ]]
	--[[ 				border = { ]]
	--[[ 					style = "rounded", ]]
	--[[ 				}, ]]
	--[[ 				win_options = { ]]
	--[[ 					winhighlight = "Normal:Normal,FloatBorder:FloatBorder", ]]
	--[[ 				}, ]]
	--[[ 			}, ]]
	--[[ 			hooks = { ]]
	--[[ 				--	before_mount = function(input) ]]
	--[[ 				--	end, ]]
	--[[ 				--	after_mount = function(input) ]]
	--[[ 				--	end, ]]
	--[[ 				set_keymaps = function(imap, feedkeys) ]]
	--[[ 					local fn = require("fine-cmdline").fn ]]
	--[[ 					imap("<M-k>", fn.up_search_history) ]]
	--[[ 					imap("<M-j>", fn.down_search_history) ]]
	--[[ 					imap("<Up>", fn.up_history) ]]
	--[[ 					imap("<Down>", fn.down_history) ]]
	--[[ 					imap("<M-r>", function() ]]
	--[[ 						if vim.fn.pumvisible() == 0 then ]]
	--[[ 							feedkeys("%s///gc<Left><Left><Left><Left>") ]]
	--[[ 						end ]]
	--[[ 					end) ]]
	--[[ 				end, ]]
	--[[ 			}, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ }, ]]
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
		priority = 1000, -- Ensure it loads first
	},

	-- Cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	"f3fora/cmp-spell",
	"hrsh7th/cmp-calc",
	--[[ "hrsh7th/cmp-nvim-lsp-signature-help",  -- uncmt in cmp config ]]

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
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	"jose-elias-alvarez/typescript.nvim",
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
	},
	--[[ { ]]
	--[[ "simrat39/rust-tools.nvim", ]]
	--[[ 	ft = "rust", ]]
	--[[ 	dependencies = "neovim/nvim-lspconfig", ]]
	--[[ 	opts = function() ]]
	--[[ 		return require("rust-tools") ]]
	--[[ 	end, ]]
	--[[ 	config = function(_, opts) ]]
	--[[ 		require("rust-tools").setup(opts) ]]
	--[[ 	end, ]]
	--[[ }, ]]

	-- Debugger
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	--[[ { ]]
	--[[ 	"mfussenegger/nvim-dap-python", ]]
	--[[ 	ft = "python", ]]
	--[[ 	dependencies = { ]]
	--[[ 		"mfussenegger/nvim-dap", ]]
	--[[ 	}, ]]
	--[[ 	config = function(_, opts) ]]
	--[[ 		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python" ]]
	--[[ 		require("dap-python").setup(path) ]]
	--[[ 	end, ]]
	--[[ }, ]]
	--[[ { ]]
	--[[ 	"leoluz/nvim-dap-go", ]]
	--[[ 	ft = "go", ]]
	--[[ 	dependencies = "mfussenegger/nvim-dap", ]]
	--[[ 	config = function(_, opts) ]]
	--[[ 		require("dap-go").setup(opts) ]]
	--[[ 	end, ]]
	--[[ }, ]]
})
