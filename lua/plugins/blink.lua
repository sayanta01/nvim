return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
	},
	opts = {
		snippets = { preset = "luasnip" },
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
		},
		appearance = {
			kind_icons = {
				Text = "",
				Method = "",
				Function = "ƒ",
				Constructor = "",
				Field = "",
				Variable = "",
				Property = "󰓹",
				Class = "",
				Interface = "",
				Struct = "",
				Module = "󰩦",
				Unit = "",
				Value = "",
				Enum = "",
				EnumMember = "",
				Keyword = "",
				Constant = "П",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		},
		cmdline = {
			keymap = { preset = "cmdline" },
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" or type == "@" then
					return { "cmdline" }
				end
				return {}
			end,
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			menu = { draw = { treesitter = { "lsp" } } },
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
