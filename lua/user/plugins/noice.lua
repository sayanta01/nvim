return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				opts = {}, -- global options for the cmdline, See section on views
				format = {
					-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern
					-- view: (default is cmdline view)
					-- opts: any options passed to the view
					-- icon_hl_group: optional hl_group for the icon
					-- title: set to anything or empty string to hide
					cmdline = { pattern = "^:", icon = "❯", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
					input = {}, -- Used by input()
					-- lua = false, -- to disable a format
				},
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically
				enabled = false,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = "virtualtext",
			},
			popupmenu = {
				enabled = true,
				backend = "nui", -- backend to use to show regular cmdline completions
				-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
				kind_icons = {}, -- set to `false` to disable icons
			},
			redirect = {
				view = "popup",
				filter = { event = "msg_show" },
			},
			-- You can add any custom commands below that will be available with `:Noice command`
			commands = {
				history = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
				},
				-- :Noice last
				last = {
					view = "popup",
					opts = { enter = true, format = "details" },
					filter = {
						any = {
							{ event = "notify" },
							{ error = true },
							{ warning = true },
							{ event = "msg_show", kind = { "" } },
							{ event = "lsp", kind = "message" },
						},
					},
					filter_opts = { count = 1 },
				},
				-- :Noice errors
				errors = {
					view = "popup",
					opts = { enter = true, format = "details" },
					filter = { error = true },
					filter_opts = { reverse = true },
				},
			},
			notify = {
				-- Noice can be used as `vim.notify` so you can route any notification like other messages
				enabled = true,
				view = "notify",
			},
			lsp = {
				progress = {
					enabled = false,
					format = "lsp_progress",
					format_done = "lsp_progress_done",
					throttle = 1000 / 40, -- frequency to update lsp progress message
					view = "mini",
				},
				override = {
					-- override the default lsp markdown formatter with Noice
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					-- override the lsp markdown formatter with Noice
					["vim.lsp.util.stylize_markdown"] = true,
					-- override cmp documentation with Noice (needs the other options to work)
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					enabled = true,
					silent = false, -- set to true to not show a message if hover is not available
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 60, -- Debounce lsp signature help request by 60ms
					},
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "notify",
					opts = {},
				},
				-- defaults for hover and signature help
				documentation = {
					view = "hover",
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
			},
			markdown = {
				hover = {
					["|(%S-)|"] = vim.cmd.help, -- vim help links
					["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
				},
				highlights = {
					["|%S-|"] = "@text.reference",
					["@%S+"] = "@parameter",
					["^%s*(Parameters:)"] = "@text.title",
					["^%s*(Return:)"] = "@text.title",
					["^%s*(See also:)"] = "@text.title",
					["{%S-}"] = "@parameter",
				},
			},
			health = {
				checker = false,
			},
			smart_move = {
				-- noice tries to move out of the way of existing floating windows
				enabled = true,
				excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			throttle = 1000 / 40, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode
			views = {},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
				},
			},
			status = {},
			format = {},
		})

		vim.notify = require("notify")
		require("notify").setup({
			fps = 20,
			icons = {
				DEBUG = " ",
				ERROR = " ",
				INFO = " 󰋽",
				TRACE = " ✎",
				WARN = " ",
			},
			level = 1,
			--[[ minimum_width = 60, ]]
			--[[ maximum_width = 60, ]]
			stages = "fade", -- slide, static
			render = "compact", -- minimal
			timeout = 1000,
		})
	end,
}
