return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "SmiteshP/nvim-navic" },
	event = "VeryLazy",
	config = function()
		local lualine = require("lualine")
		local navic = require("nvim-navic")

		vim.g.navic_silence = true
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.supports_method("textDocument/documentSymbol") then
					navic.attach(client, args.buf)
				end
			end,
		})

		navic.setup({
			icons = {
				File = " ",
				Module = "󰩦 ",
				Namespace = "󰦮 ",
				Package = " ",
				Class = " ",
				Method = " ",
				Property = "󰓹 ",
				Field = " ",
				Constructor = " ",
				Enum = " ",
				Interface = " ",
				Function = "ƒ ",
				Variable = " ",
				Constant = "П ",
				String = " ",
				Number = "󰎠 ",
				Boolean = " ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = " ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
			separator = " › ",
			highlight = true,
			depth_limit = 5,
			lazy_update_context = true,
		})

		local colors = {
			bg = "#",
			fg = "#9399b1",
			yellow = "#ffc777",
			cyan = "#008080",
			green = "#c3e88d",
			orange = "#ff8800",
			magenta = "#c678dd",
			blue = "#65bcff",
			red = "#ff5189",
		}

		local conditions = {
			hide_in_width = function()
				return vim.fn.winwidth(0) > 90
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						function()
							return " "
						end,
						color = function()
							local mode_color = {
								n = colors.blue,
								no = colors.green,
								v = colors.magenta,
								V = colors.magenta,
								[""] = colors.magenta,
								s = colors.orange,
								S = colors.orange,
								[""] = colors.orange,
								i = colors.green,
								ic = colors.yellow,
								R = colors.red,
								Rv = colors.red,
								c = colors.yellow,
								cv = colors.green,
								ce = colors.green,
								r = colors.cyan,
								rm = colors.cyan,
								["r?"] = colors.cyan,
								["!"] = colors.green,
								t = colors.green,
							}
							return { fg = mode_color[vim.fn.mode()] }
						end,
						padding = { right = 1 },
					},
					{ "location" },
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available() and navic.get_location() ~= "" and conditions.hide_in_width()
						end,
					},
				},

				lualine_x = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = "", modified = "~", removed = "—" },
						cond = conditions.hide_in_width,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		}

		lualine.setup(config)
	end,
}
