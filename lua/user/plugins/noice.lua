return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { icon = "❯" },
					search_down = { icon = "🔎 " },
					search_up = { icon = "🔎 " },
					help = { icon = "" },
				},
			},
			messages = {
				enabled = false,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = "virtualtext",
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
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			health = {
				checker = false,
			},
			presets = {
				bottom_search = true,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = false,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
				},
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 24,
			icons = {
				DEBUG = " ",
				ERROR = " ",
				INFO = " ",
				TRACE = " ",
				WARN = " ",
			},
			level = 2,
			stages = "fade",
			render = "minimal",
			timeout = 1000,
		},
		init = function()
			-- vim.opt.termguicolors = true
			vim.notify = require("notify")
		end,
	},
}
