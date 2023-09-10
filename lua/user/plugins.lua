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

-- Notify config --
--[[ local BUILTIN_STAGES = { ]]
--[[ 	fade_IN_SLIDE_OUT = "fade_in_slide_out", -- fade, slide, static ]]
--[[ } ]]
--[[ local BUILTIN_RENDERERS = { ]]
--[[ 	DEFAULT = "compact", -- minimal, compact, simple ]]
--[[ } ]]
require("lazy").setup({
	-- Dependences --
	"nvim-lua/popup.nvim",
	{ "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
	},
	--[[ { ]]
	--[[ 	"rcarriga/nvim-notify", ]]
	--[[ 	config = function() ]]
	--[[ 		require("notify").setup({ ]]
	--[[ 			timeout = 2000, ]]
	--[[ 			level = vim.log.levels.INFO, ]]
	--[[ 			fps = 40, ]]
	--[[ 			icons = { ]]
	--[[ 				ERROR = "", ]]
	--[[ 				WARN = "", ]]
	--[[ 				INFO = "", ]]
	--[[ 				DEBUG = "", ]]
	--[[ 				TRACE = "✎", ]]
	--[[ 			}, ]]
	--[[ 			stages = BUILTIN_STAGES.FADE_IN_SLIDE_OUT, ]]
	--[[ 			render = BUILTIN_RENDERERS.DEFAULT, ]]
	--[[ 			max_width = nil, ]]
	--[[ 			max_height = nil, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ }, ]]

	-- Features --
	--[[ { ]]
	--[[ 	"stevearc/dressing.nvim", ]]
	--[[ 	lazy = true, ]]
	--[[ 	init = function() ]]
	--[[ 		vim.ui.select = function(...) ]]
	--[[ 			require("lazy").load({ plugins = { "dressing.nvim" } }) ]]
	--[[ 			return vim.ui.select(...) ]]
	--[[ 		end ]]
	--[[ 		vim.ui.input = function(...) ]]
	--[[ 			require("lazy").load({ plugins = { "dressing.nvim" } }) ]]
	--[[ 			return vim.ui.input(...) ]]
	--[[ 		end ]]
	--[[ 	end, ]]
	--[[ }, ]]

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("user.alpha")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.gitsigns")
		end,
		cmd = "Gitsigns",
		event = "User FileOpened",
		--[[ event = { "BufReadPre", "BufNewFile" }, ]]
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.toggleterm")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 299
		end,
	},

	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("user.nvim-tree")
		end,
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
		event = "User DirOpened",
	},

	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		config = function()
			require("user.telescope")
		end,
		dependencies = {
			"nvim-telescope/telescope-media-files.nvim",
			"ahmedkhalf/project.nvim",
			-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				-- detection_methods = { "lsp", "pattern" }, NOTE: lsp detection will get annoying with multiple langs in one project
				detection_methods = { "pattern" },
				-- patterns used to detect root dir, when **"pattern"** is in detection_methods
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
				show_hidden = false,
				-- when set to false, you will get a message when project.nvim changes your directory
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"numToStr/Comment.nvim",
		keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
		event = "User FileOpened",
		config = function()
			require("user.comment")
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "User FileOpened",
			--[[ event = "VeryLazy", ]]
		},
	},

	{
		"windwp/nvim-autopairs", -- autopairs, integrates with cmp & treesitter
		event = "InsertEnter",
		--[[ dependencies = { ]]
		--[[ 	"hrsh7th/nvim-cmp", ]]
		--[[ }, ]]
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true, -- treesitter integration
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
				enable_moveright = true,
				-- disable when recording or executing a macro
				disable_in_macro = false,
				-- add bracket pairs after quote
				enable_afterquote = true,
				-- map the <BS> key
				map_bs = true,
				-- map <c-w> to delete a pair if possible
				map_c_w = false,
				-- disable when insert after visual block mode
				disable_in_visualblock = false,
				-- change default fast_wrap
			})

			-- import nvim-autopairs completion functionality
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"kylechui/nvim-surround",
		config = function()
			require("user.surround")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
	},

	--[[ { ]]
	--[[ 	"NvChad/nvim-colorizer.lua", ]]
	--[[ 	event = { "BufReadPre", "BufNewFile" }, ]]
	--[[ }, ]]
	{
		"uga-rosa/ccc.nvim",
		cmd = { "CccPick", "CccConvert", "CccHighlighterToggle" },
		config = true,
	},

	{
		"RRethy/vim-illuminate",
		config = function()
			require("user.illuminate")
		end,
		event = { "VeryLazy", "LspAttach" },
	},

	-- Themes --
	{
		"folke/tokyonight.nvim",
		dependencies = {
			"rose-pine/neovim",
			"catppuccin/nvim",
			"RRethy/nvim-base16",
			"lunarvim/lunar.nvim",
			"sainnhe/gruvbox-material",
			"tiagovla/tokyodark.nvim",
			"lunarvim/synthwave84.nvim",
			"B4mbus/oxocarbon-lua.nvim",
			"olimorris/onedarkpro.nvim",
		},
		lazy = true,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		config = function()
			require("rose-pine").setup()
		end,
	},

	-- Cmp --
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-calc",
		},
		config = function()
			require("user.cmp")
		end,
	},

	-- LSP --
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
	},

	--[[ { ]]
	--[[ 	"glepnir/lspsaga.nvim", ]]
	--[[ 	event = "LspAttach", ]]
	--[[ }, ]]

	--[[ { ]]
	--[[ 	"SmiteshP/nvim-navic", ]]
	--[[ 	event = "User FileOpened", ]]
	--[[ 	config = function() ]]
	--[[ 		require("user.navic") ]]
	--[[ 	end, ]]
	--[[ }, ]]

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},

	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
		lazy = true,
	},

	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
	},

	-- Debugger --
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local mason_nvim_dap = require("mason-nvim-dap")

			mason_nvim_dap.setup({
				ensure_installed = {
					"python",
					"codelldb",
					"delve",
					"node2",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
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
		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
				delve = {
					initialize_timeout_sec = 20,
					port = "${port}",
				},
			})
		end,
	},

	-- Misc --
	--[[ "ThePrimeagen/vim-be-good", ]]
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
})
