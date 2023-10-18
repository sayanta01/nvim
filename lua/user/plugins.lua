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
	-- Dependences --
	{ "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Preety --
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"folke/noice.nvim",
		config = function()
			require("user.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{
		"goolord/alpha-nvim",
		config = function()
			require("user.alpha")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("user.lualine")
		end,
		event = "VeryLazy",
	},

	-- Features --
	--[[ { ]]
	--[[ 	"kevinhwang91/nvim-ufo", -- configure this ]]
	--[[ 	config = function() ]]
	--[[ 		require("ufo").setup() ]]
	--[[ 	end, ]]
	--[[ 	event = { "VeryLazy", "LspAttach" }, ]]
	--[[ 	dependencies = { ]]
	--[[ 		"kevinhwang91/promise-async", ]]
	--[[ 	}, ]]
	--[[ }, ]]

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.gitsigns")
		end,
		event = "VeryLazy",
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.toggleterm")
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			require("user.whichkey")
		end,
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
		config = function()
			require("user.telescope")
		end,
		cmd = "Telescope",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope-media-files.nvim",
			--[[ { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true }, ]]
			{
				"ThePrimeagen/refactoring.nvim",
				config = function()
					require("user.refactoring")
				end,
			},
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
			"hiphish/rainbow-delimiters.nvim",
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		--[[ 	event = { "BufReadPost", "BufNewFile" }, ]]
		config = function()
			require("user.indentline")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("user.comment")
		end,
		keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
		event = "User FileOpened",
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
		},
	},

	{
		"windwp/nvim-autopairs", -- autopairs, integrates with cmp & treesitter
		event = "InsertEnter",
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
		keys = { "cs", "ds", "ys" },
	},

	--[[ { ]]
	--[[ 	"kylechui/nvim-surround", ]]
	--[[ 	config = function() ]]
	--[[ 		require("user.surround") ]]
	--[[ 	end, ]]
	--[[ 	event = "VeryLazy", ]]
	--[[ }, ]]

	{
		"akinsho/bufferline.nvim",
		config = function()
			require("user.bufferline")
		end,
		event = "VeryLazy",
	},

	{
		"uga-rosa/ccc.nvim",
		cmd = { "CccPick", "CccConvert", "CccHighlighterToggle" },
		--[[ config = true, ]]
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
		"lunarvim/lunar.nvim",
		dependencies = {
			--[[ "B4mbus/oxocarbon-lua.nvim", ]]
			--[[ "olimorris/onedarkpro.nvim", ]]
			--[[ "RRethy/nvim-base16", ]]
			--[[ "lunarvim/synthwave84.nvim", ]]
			"catppuccin/nvim",
			"sainnhe/gruvbox-material",
			"tiagovla/tokyodark.nvim",
			"rose-pine/neovim",
		},
		lazy = true,
	},

	-- Cmp --
	{
		"hrsh7th/nvim-cmp", -- check keymaps
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", lazy = true },
			{ "saadparwaiz1/cmp_luasnip", lazy = true },
			{ "hrsh7th/cmp-buffer", lazy = true },
			{ "hrsh7th/cmp-path", lazy = true },
			{ "f3fora/cmp-spell", lazy = true },
			{ "hrsh7th/cmp-calc", lazy = true },
		},
		config = function()
			require("user.cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = {
			{ "rafamadriz/friendly-snippets", lazy = true },
		},
	},

	--[[ { ]]
	--[[ 	"ThePrimeagen/harpoon", ]]
	--[[ 	config = function() ]]
	--[[ 		local keymap = vim.keymap ]]
	--[[ 		keymap.set( ]]
	--[[ 			"n", ]]
	--[[ 			"<leader>hm", ]]
	--[[ 			"<cmd>lua require('harpoon.mark').add_file()<cr>", ]]
	--[[ 			{ desc = "Mark file with harpoon" } ]]
	--[[ 		) ]]
	--[[ 		keymap.set( ]]
	--[[ 			"n", ]]
	--[[ 			"<leader>hn", ]]
	--[[ 			"<cmd>lua require('harpoon.ui').nav_next()<cr>", ]]
	--[[ 			{ desc = "Go to next harpoon mark" } ]]
	--[[ 		) ]]
	--[[ 		keymap.set( ]]
	--[[ 			"n", ]]
	--[[ 			"<leader>hp", ]]
	--[[ 			"<cmd>lua require('harpoon.ui').nav_prev()<cr>", ]]
	--[[ 			{ desc = "Go to previous harpoon mark" } ]]
	--[[ 		) ]]
	--[[ 	end, ]]
	--[[ }, ]]

	-- LSP --
	{
		"williamboman/mason.nvim",
		config = function()
			require("user.mason")
		end,
		build = function()
			pcall(function()
				require("mason-registry").refresh()
			end)
		end,
		event = "User FileOpened",
		lazy = true,
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", lazy = true },
			{
				"jayp0521/mason-null-ls.nvim",
				config = function()
					local mason_nvim_dap = require("mason-null-ls")
					mason_nvim_dap.setup({
						-- formatters & linters
						ensure_installed = {
							-- "rubocop",
							"google-java-format",
							"markdownlint",
							"yamlfmt",
							"phpcbf",
							"sqlfluff",
							"shellcheck",
							"shfmt",
							"stylua",
							"gofumpt",
							"black",
							"prettier",
							"eslint_d",
						},
						automatic_installation = true,
					})
				end,
				lazy = true,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		config = function()
			require("user.lsp")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "VeryLazy", "lspattach" },
		lazy = true,
	},

	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			show_basename = false,
			kinds = {
				File = "",
				Module = "",
				Namespace = "",
				Package = "",
				Class = "",
				Method = "",
				Property = "",
				Field = "",
				Constructor = "",
				Enum = "",
				Interface = "",
				Function = "󰊕",
				Variable = "",
				Constant = "",
				String = "",
				Number = "",
				Boolean = "",
				Array = "",
				Object = "",
				Key = "",
				Null = "",
				EnumMember = "",
				Struct = "",
				Event = "",
				Operator = "󱖦",
				TypeParameter = "",
			},
		},
	},

	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
		lazy = true,
	},

	{
		"simrat39/rust-tools.nvim", -- do lazy_load
		ft = { "rust" },
	},

	-- Debugger --
	{
		"mfussenegger/nvim-dap", -- do lazy_load
		dependencies = {
			"rcarriga/nvim-dap-ui",
			event = "VeryLazy",
		},
		config = function()
			require("user.dap")
		end,
		cmd = { "DapUIToggle", "DapToggleRepl", "DapToggleBreakpoint" },
		lazy = true,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			local mason_nvim_dap = require("mason-nvim-dap")
			mason_nvim_dap.setup({
				ensure_installed = {
					"python",
					"codelldb",
					"delve",
					"js",
				},
				automatic_installation = true,
			})
		end,
	},

	--[[ { ]]
	--[[ 	"theHamsta/nvim-dap-virtual-text", ]]
	--[[ 	config = function() ]]
	--[[ 		require("nvim-dap-virtual-text").setup() ]]
	--[[ 	end, ]]
	--[[ 	lazy = true, ]]
	--[[ }, ]]

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
					path = "dlv",
					initialize_timeout_sec = 20,
					port = "${port}",
				},
			})
		end,
	},

	-- Misc --
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
		lazy = true,
	},

	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
})
