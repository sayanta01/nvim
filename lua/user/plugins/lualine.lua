return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local colors = {
			bg = "#",
			fg = "#9399b1",
			yellow = "#ecbe7b",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#009E23",
			orange = "#ff8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ff5555",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local config = {
			options = {
				disabled_filetypes = {
					statusline = { "toggleterm", "alpha" },
					winbar = {},
				},
				-- Disable sections and component separators
				component_separators = "",
				--[[ component_separators = { left = " ", right = " " }, ]]
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section, Both are highlighted by c theme, So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x ot right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			-- mode component
			function()
				return " "
			end,
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.green,
					i = colors.red,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 2 },
		})

		ins_left({
			"branch",
			icon = "󰘬",
			color = { fg = colors.violet, gui = "bold" },
		})

		ins_left({
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		})

		ins_left({
			"location",
		})

		-- Insert mid section, You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
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
			icon = "Lsp -",
			color = { fg = "#44466a" },
		})

		ins_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = "󰋽 " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
			},
		})

		ins_right({
			"buffers",
			show_filename_only = true,
			hide_filename_extension = true,
			show_modified_status = true,
			mode = 0,
			max_length = vim.o.columns * 1 / 2,
			buffers_color = {
				active = { fg = colors.blue },
				inactive = { fg = colors.fg },
			},
			symbols = {
				modified = " 󰧞",
				alternate_file = "",
				directory = "",
			},
		})

		-- ins_right({
		-- 	"filesize",
		-- 	color = { fg = colors.violet, gui = "italic" },
		-- 	cond = conditions.buffer_not_empty,
		-- })

		lualine.setup(config)
	end,
}
