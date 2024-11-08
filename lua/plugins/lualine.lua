return {
	"nvim-lualine/lualine.nvim",
	event = "UIEnter",
	config = function()
		local lualine = require("lualine")

		local colors = {
			-- bg = "#",
			fg = "#9399b1",
			black = "#080808",
			white = "#d0d5e3",
			yellow = "#ecbe7b",
			cyan = "#008080",
			green = "#98be65",
			orange = "#FF8800",
			magenta = "#c678dd",
			blue = "#51aFeF",
			red = "#FF5189",
		}

		local config = {
			options = {
				component_separators = "",
				disabled_filetypes = {
					statusline = {
						"alpha",
						"dashboard",
						"NvimTree",
						"dapui_scopes",
						"dapui_breakpoints",
						"dapui_stacks",
						"dapui_watches",
						"dap-repl",
						"dapui_console",
					},
				},
				theme = {
					normal = {
						a = { fg = colors.black, bg = colors.blue },
						b = { fg = colors.blue, bg = colors.bg },
						c = { fg = colors.fg, bg = colors.bg },
					},
					insert = {
						a = { fg = colors.black, bg = colors.green },
						b = { fg = colors.green, bg = colors.bg },
					},
					visual = {
						a = { fg = colors.black, bg = colors.magenta },
						b = { fg = colors.magenta, bg = colors.bg },
					},
					replace = {
						a = { fg = colors.black, bg = colors.red },
						b = { fg = colors.red, bg = colors.bg },
					},
					command = {
						a = { fg = colors.black, bg = colors.yellow },
						b = { fg = colors.yellow, bg = colors.bg },
					},
					terminal = {
						a = { fg = colors.black, bg = colors.green },
						b = { fg = colors.green, bg = colors.bg },
					},
					inactive = {
						a = { fg = colors.blue, bg = colors.white },
						c = { fg = colors.bg, bg = colors.white },
					},
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				-- lualine_a = { { "mode", separator = { right = "" }, padding = { left = 1, right = 0 } } },
				-- lualine_b = { { "branch", icon = "", separator = { right = "" }, padding = { left = 2, right = 0 } } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			function()
				return " "
			end,
			color = function()
				-- change color according to mode
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
			padding = { right = 2 },
		})

		ins_left({
			"branch",
			icon = "",
		})

		ins_left({
			"location",
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
				hint = { fg = colors.green },
			},
		})

		ins_left({
			function()
				return "%="
			end,
		})

		-- ins_left({
		-- 	function()
		-- 		local msg = "No Active Lsp"
		-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		-- 		local clients = vim.lsp.get_active_clients()
		-- 		if next(clients) == nil then
		-- 			return msg
		-- 		end
		-- 		for _, client in ipairs(clients) do
		-- 			local filetypes = client.config.filetypes
		-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
		-- 				return client.name
		-- 			end
		-- 		end
		-- 		return msg
		-- 	end,
		-- 	color = { fg = "#44466a" },
		-- })

		ins_right({
			"diff",
			symbols = { added = "", modified = "∼", removed = "" },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
		})

		lualine.setup(config)
	end,
}
