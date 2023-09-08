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
	"nvim-lua/plenary.nvim",
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
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
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

	"kyazdani42/nvim-tree.lua",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-media-files.nvim",
			-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		--[[ config = function() ]]
		--[[ 	require("project_nvim").setup() ]]
		--[[ end, ]]
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
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
	},

	{
		"windwp/nvim-autopairs", -- autopairs, integrates with cmp & treesitter
		event = "InsertEnter",
		--[[ dependencies = { ]]
		--[[ 	"hrsh7th/nvim-cmp", ]]
		--[[ }, ]]
		config = function()
			-- import nvim-autopairs
			local autopairs = require("nvim-autopairs")

			-- configure autopairs
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
		event = { "VeryLazy", "LspAttach" },
	},

	-- Themes --
	--[[ { ]]
	--[[   "catppuccin/nvim", ]]
	--[[   lazy = true, ]]
	--[[   name = "catppuccin", ]]
	--[[ }, ]]
	--[[ { ]]
	--[[   "uloco/bluloco.nvim", ]]
	--[[   lazy = true, ]]
	--[[   dependencies = { "rktjmp/lush.nvim" }, ]]
	--[[   config = function() ]]
	--[[     require("bluloco").setup() ]]
	--[[   end, ]]
	--[[ }, ]]
	"RRethy/nvim-base16",
	{
		"folke/tokyonight.nvim",
		dependencies = {
			"lunarvim/lunar.nvim",
			"sainnhe/gruvbox-material",
			"tiagovla/tokyodark.nvim",
			"projekt0n/github-nvim-theme",
			"lunarvim/synthwave84.nvim",
			"B4mbus/oxocarbon-lua.nvim",
			"Mofiqul/vscode.nvim",
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
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end

			local snip_status_ok, luasnip = pcall(require, "luasnip")
			if not snip_status_ok then
				return
			end

			-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			local kind_icons = {
				Text = "",
				--[[ Text = "", ]]
				Method = "",
				--[[ Method = "", ]]
				Function = "",
				Constructor = "",
				Field = "",
				--[[ Field = "", ]]
				Variable = "",
				--[[ Variable = "", ]]
				Class = "",
				--[[ Class = "", ]]
				Interface = "",
				--[[ Interface = "", ]]
				Module = " ",
				--[[ Module = "", ]]
				Property = "",
				--[[ Property = "ﰠ", ]]
				Unit = " ",
				--[[ Unit = "", ]]
				Value = "",
				Enum = "練",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				--[[ Reference = "", ]]
				Folder = "",
				EnumMember = "",
				Constant = "",
				--[[ Constant = "", ]]
				Struct = "פּ",
				--[[ Struct = "", ]]
				Event = "",
				Operator = "󱖦",
				TypeParameter = "𝙏",
				--[[ TypeParameter = "", ]]
				Namespace = "",
				Package = "",
				String = "",
				--[[ String = "", ]]
				Number = "",
				Boolean = "◩",
				Array = "",
				Object = "",
				Key = "",
				Null = "ﳠ",
				--  Extra icons
				--[[ Tag = "", ]]
				--[[ Array = "", ]]
				--[[ Value = "", ]]
				--[[ List = "", ]]
				--[[ Note = "", ]]
				--[[ NoteBook = " ", ]]
				--[[ DebugConsole = "", ]]
				--[[ Dashboard = " ", ]]
				--[[ NewFile = " ", ]]
				--[[ Diff = " ", ]]
				--[[ Diff = "", ]]
				--[[ Rename = " ", ]]
				--[[ Enum = "ℰ", ]]
				--[[ String = " ", ]]
				--[[ Misc = " ", ]]
				--[[ Reference = " ", ]]
				--[[ Struct = " ", ]]
				--[[ CircuitBoard = "", ]]
				--[[ Robot = "ﮧ", ]]
				--[[ CloudDownload = "", ]]
				--[[ Boolean = " ", ]]
				--[[ Boolean = "蘒", ]]
			}

			cmp.setup({
				snippet = {
					-- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For Luasnip
					end,
				},
				-- Key mapping
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
					["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- in Insert --
					["<C-y>"] = cmp.config.disable,
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					-- Accept currently selected item. If none selected, 'select' first item.
					-- Set 'select' to 'false' to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				}),
				-- sources for autocompletion
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "spell" },
					{ name = "calc" },
				},
				-- Formatting
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snip]",
							buffer = "[Buf]",
							nvim_lua = "[LSP_Lua]",
							path = "[Path]",
							spell = "[Spell]",
							calc = "[Calc]",
						})[entry.source.name]
						return vim_item
					end,
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				window = {
					completion = {
						scrollbar = true,
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						--[[ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, ]]
						--[[ winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None", ]]
					},
					documentation = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						--[[ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, ]]
						--[[ winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None", ]]
					},
				},
				experimental = {
					ghost_text = false,
				},
			})
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

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},

	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
	},

	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
		lazy = true,
	},

	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		--[[ dependencies = "neovim/nvim-lspconfig", ]]
		--[[ config = function(_, opts) ]]
		--[[ 	require("rust-tools").setup(opts) ]]
		--[[ end, ]]
	},

	-- Debugger --
	{
		"mfussenegger/nvim-dap",
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
	"ThePrimeagen/vim-be-good",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
})
