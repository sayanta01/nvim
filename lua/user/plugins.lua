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
	"nvim-lua/plenary.nvim",
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
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Header
			dashboard.section.header.val = {
				[[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
				[[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
				[[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
				[[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
				[[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
				[[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
				[[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
				[[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
				[[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
				[[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
				[[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
			}
			-- Menu
			dashboard.section.buttons.val = {
				dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
				dashboard.button("n", "  New file", ":ene | startinsert <CR>"),
				dashboard.button("b", "  Bookmarks", ":Telescope marks<CR>"),
				dashboard.button("p", "  Projects", ":lua require('telescope').extensions.projects.projects()<CR>"),
				dashboard.button("r", "󱑓  Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
				dashboard.button("h", "  Check health", ":checkhealth<CR>"),
				dashboard.button("c", "  Config", ":e $MYVIMRC | :cd %:p:h <CR>"),
				dashboard.button("q", "  quit", ":qa<CR>"),
			}
			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	"akinsho/toggleterm.nvim",

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
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
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = "❯ ",
					--[[ prompt_prefix = "   ", ]]
					--[[ selection_caret = "|> ", ]]
					path_display = { "smart" },
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "descending",
					layout_strategy = "horizontal",
					layout_config = {
						width = 0.80,
						preview_cutoff = 120,
						horizontal = {
							preview_width = function(_, cols, _)
								if cols < 120 then
									return math.floor(cols * 0.5)
								end
								return math.floor(cols * 0.6)
							end,
							mirror = false,
						},
						vertical = { mirror = false },
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { ".git/", "node_modules/", "target/", "docs/", ".settings/" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-c>"] = actions.close, -- ESC
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-h>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
						},
						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-h>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["?"] = actions.which_key,
						},
					},
				},
				file_ignore_patterns = {},
				pickers = {
					-- Default configuration for builtin pickers goes here
					find_files = {
						hidden = true,
					},
					live_grep = {
						--[[ @usage don't include the filename in the search results ]]
						only_sort_text = true,
					},
					grep_string = {
						only_sort_text = true,
					},
					planets = {
						show_pluto = true,
						show_moon = false,
					},
					git_files = {
						hidden = true,
						show_untracked = true,
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					-- Extension configuration goes here:
					media_files = {
						filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
						find_cmd = "rg", -- find command ( defaults to "fd" )
					},
				},
			})

			telescope.load_extension("media_files")
			-- telescope.load_extension("fzf")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = true,
				},
				-- enable indentation
				indent = { enable = true, disable = { "yaml" } },
				autotag = { enable = true },
				ensure_installed = {
					"c",
					"cpp",
					"c_sharp",
					"python",
					"bash",
					"awk",
					"json",
					"lua",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"php",
					"sql",
					"go",
					"rust",
					"markdown",
					"markdown_inline",
					"java",
					"dockerfile",
					"gitignore",
					"regex",

					"yaml",
					"kotlin",
					"ruby",
					"graphql",
					"solidity",

					"astro",
					"vue",
					"scss",
					"latex",
					"prisma",
					"svelte",
				},
				sync_install = false,
				-- ignore_install = {},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				auto_install = true,
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
	},

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		config = function()
			-- import comment plugin safely
			local comment = require("Comment")

			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			-- enable comment
			comment.setup({
				-- for commenting tsx and jsx files
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
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
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
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

	-- {
	--   "windwp/nvim-ts-autotag",
	--   config = function()
	--     require("nvim-ts-autotag").setup()
	--   end,
	-- },

	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"akinsho/bufferline.nvim",
		branch = "main",
	},
	--[[ { ]]
	--[[ 	"NvChad/nvim-colorizer.lua", ]]
	--[[ 	event = { "BufReadPre", "BufNewFile" }, ]]
	--[[ }, ]]
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
				snippet = { -- configure how nvim-cmp interacts with snippet engine
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

				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				window = {
					completion = {
						scrollbar = true,
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						--[[ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, ]]
						winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
					},
					documentation = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						--[[ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, ]]
						winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
					},
				},
				experimental = {
					ghost_text = false,
				},
			})
		end,
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
