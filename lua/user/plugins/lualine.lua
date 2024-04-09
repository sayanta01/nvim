return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local colors = {
			bg = "#",
			fg = "#9399b1",
			black = "#080808",
			white = "#c6c6c6",
			lazy = "#3B4261",
			yellow = "#ecbe7b",
			cyan = "#008080",
			green = "#c3e88d",
			green1 = "#009e23",
			orange = "#ff8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#82aaff",
			red = "#ff5189",
		}

		-- local conditions = {
		-- 	buffer_not_empty = function()
		-- 		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		-- 	end,
		-- 	hide_in_width = function()
		-- 		return vim.fn.winwidth(0) > 80
		-- 	end,
		-- 	check_git_workspace = function()
		-- 		local filepath = vim.fn.expand("%:p:h")
		-- 		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		-- 		return gitdir and #gitdir > 0 and #gitdir < #filepath
		-- 	end,
		-- }

		local config = {
			options = {
				-- icons_enabled = true,
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section, Both are highlighted by c theme, So we
					-- are just setting default looks o statusline
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
						a = { fg = colors.white, bg = colors.black },
						c = { fg = colors.fg, bg = colors.bg },
					},
				},
				-- Disable sections and component separators
				component_separators = "",
				disabled_filetypes = {
					statusline = { "toggleterm", "alpha", "dashboard" },
					-- winbar = {},
				},
			},
			sections = {
				lualine_a = {},
        -- lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = {},
				-- lualine_b = { { "branch", icon = "󰘬", separator = { left = "" }, right_padding = 2 } },
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

		-- Add component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Add component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			-- mode component
			function()
				return " "
			end,
			color = function()
				-- auto change color according to mode
				local mode_color = {
					n = colors.blue,
					i = colors.green,
					v = colors.magenta,
					[""] = colors.magenta,
					V = colors.magenta,
					c = colors.yellow,
					no = colors.green,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.red,
					Rv = colors.red,
					cv = colors.green,
					ce = colors.green,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.green,
					t = colors.green,
				}
				return {
					-- fg = colors.black,
					fg = mode_color[vim.fn.mode()],
				}
			end,
			padding = { right = 2 },
		})

		ins_left({
			"branch",
			icon = " 󰘬",
			color = { fg = colors.violet, gui = "bold" },
		})

		ins_left({
			"location",
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = "󰋽 " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
			},
		})

		ins_left({
			function()
				return "%="
			end,
		})

		ins_left({
			function()
				local msg = "No Active Lsp"
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			color = { fg = "#44466a" },
		})

		ins_right({
			"diff",
			symbols = { added = "", modified = "~", removed = "" },
			diff_color = {
				added = { fg = colors.green1 },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			-- cond = conditions.hide_in_width,
		})

		-- ins_right({
		-- 	"buffers",
		-- 	show_filename_only = true,
		-- 	hide_filename_extension = true,
		-- 	show_modified_status = true,
		-- 	mode = 0,
		-- 	max_length = vim.o.columns * 1 / 2,
		-- 	buffers_color = {
		-- 		active = { fg = colors.blue },
		-- 		inactive = { fg = colors.fg },
		-- 	},
		-- 	symbols = {
		-- 		modified = " 󰧞",
		-- 		alternate_file = "",
		-- 		directory = "",
		-- 	},
		-- })

		lualine.setup(config)
	end,
}
