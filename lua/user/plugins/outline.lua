return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = "Outline",
	opts = {
		outline_window = {
			position = "right",
			-- split_command = nil,
			width = 29,
			relative_width = true,
			auto_close = false,
			auto_jump = false,
			-- boolean or integer for milliseconds duration to apply a temporary highlight
			-- when jumping. false to disable
			-- jump_highlight_duration = 299,
			center_on_jump = true,
			show_numbers = false,
			show_relative_numbers = false,
			wrap = false,
			-- show_cursorline = false,
			-- hide_cursor = false,
			-- focus_on_open = true,
			-- winhl = "",
		},

		outline_items = {
			-- Show extra details with the symbols (lsp dependent) as virtual next
			show_symbol_details = false,
			-- Show corresponding line numbers of each symbol on the left column as
			-- virtual text, for quick navigation when not focused on outline
			-- Why? See this comment:
			-- https://github.com/simrat39/symbols-outline.nvim/issues/212#issuecomment-1793503563
			show_symbol_lineno = false,
			-- Whether to highlight the currently hovered symbol and all direct parents
			highlight_hovered_item = true,
			auto_set_cursor = true,
			-- Autocmd events to automatically trigger these operations
			auto_update_events = {
				-- Includes both setting of cursor and highlighting of hovered item
				-- The above two options are respected
				-- This can be triggered manually through `follow_cursor` lua API,
				-- :OutlineFollow command, or <C-g>
				follow = { "CursorMoved" },
				-- Re-request symbols from the provider
				-- This can be triggered manually through `refresh_outline` lua API, or
				-- :OutlineRefresh command
				items = { "InsertLeave", "WinEnter", "BufEnter", "BufWinEnter", "TabEnter", "BufWritePost" },
			},
		},

		guides = {
			enabled = true,
			markers = {
				bottom = "└",
				middle = "├",
				vertical = "│",
			},
		},

		symbol_folding = {
			-- Depth past which nodes will be folded by default, Set to false to unfold all on open
			autofold_depth = 1,
			-- When to auto unfold nodes
			auto_unfold = {
				-- Auto unfold currently hovered symbol
				hovered = true,
				-- Auto fold when the root level only has this many nodes
				-- Set true for 1 node, false for 0
				only = true,
			},
			markers = { "", "" },
		},

		preview_window = {
			auto_preview = false,
			open_hover_on_preview = false,
			width = 50,
			min_width = 50,
			relative_width = true,
			border = "single",
			winhl = "NormalFloat:",
			winblend = 0,
		},

		keymaps = {
			show_help = "?",
			close = { "<Esc>", "q" },
			goto_location = "<Cr>",
			peek_location = "o",
			goto_and_close = "<S-Cr>",
			restore_location = "<C-g>",
			hover_symbol = "<C-space>",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
			fold = "h",
			unfold = "l",
			fold_toggle = "<Tab>",
			fold_toggle_all = "<S-Tab>",
			fold_all = "W",
			unfold_all = "E",
			fold_reset = "R",
			-- Move down/up by one line and peek_location immediately
			-- You can also use outline_window.auto_jump=true to do this for any
			-- j/k & <down>/<up>
			down_and_jump = "<C-j>",
			up_and_jump = "<C-k>",
		},

		providers = {
			priority = { "lsp", "markdown" },
			lsp = {
				blacklist_clients = {},
			},
		},

		symbols = {
			-- Filter by kinds (string) for symbols in the outline
			-- Possible kinds are the Keys in the icons table below
			-- A filter list is a string[] with an optional exclude (boolean) field
			-- The symbols.filter option takes either a filter list or ft:filterList
			-- key-value pairs
			-- Put  exclude=true  in the string list to filter by excluding the list of
			-- kinds instead
			-- Include all except String and Constant:
			--   filter = { 'String', 'Constant', exclude = true }
			-- Only include Package, Module, and Function:
			--   filter = { 'Package', 'Module', 'Function' }
			-- See more examples below
			filter = nil,

			-- You can use a custom function that returns the icon for each symbol kind
			-- This function takes a kind (string) as parameter and should return an
			-- icon as string
			icon_fetcher = nil,
			-- 3rd party source for fetching icons, Fallback if icon_fetcher returned
			-- empty string, Currently supported values: 'lspkind'
			icon_source = nil,
			-- The next fallback if both icon_fetcher and icon_source has failed, is
			-- the custom mapping of icons specified below, The icons table is also
			-- needed for specifying hl group
			icons = {
				File = { icon = "", hl = "Identifier" },
				Module = { icon = "󱒌", hl = "Include" },
				Namespace = { icon = "", hl = "Include" },
				Package = { icon = "󰏗", hl = "Include" },
				Class = { icon = "", hl = "Type" },
				Method = { icon = "", hl = "Function" },
				Property = { icon = "", hl = "Identifier" },
				Field = { icon = "", hl = "Identifier" },
				Constructor = { icon = "", hl = "Special" },
				Enum = { icon = "ℰ", hl = "Type" },
				Interface = { icon = "", hl = "Type" },
				Function = { icon = "ƒ", hl = "Function" },
				Variable = { icon = "", hl = "Constant" },
				Constant = { icon = "󰏿", hl = "Constant" },
				String = { icon = "", hl = "String" },
				Number = { icon = "󰎠", hl = "Number" },
				Boolean = { icon = "◩", hl = "Boolean" },
				Array = { icon = "", hl = "Constant" },
				Object = { icon = "⦿", hl = "Type" },
				Key = { icon = "🔐", hl = "Type" },
				Null = { icon = "NULL", hl = "Type" },
				EnumMember = { icon = "", hl = "Identifier" },
				Struct = { icon = "", hl = "Structure" },
				Event = { icon = "🗲", hl = "Type" },
				Operator = { icon = "󰆕", hl = "Identifier" },
				TypeParameter = { icon = "𝙏", hl = "Identifier" },
				Component = { icon = "", hl = "Function" },
				Fragment = { icon = "", hl = "Constant" },
				TypeAlias = { icon = "", hl = "Type" },
				Parameter = { icon = "", hl = "Identifier" },
				StaticMethod = { icon = "", hl = "Function" },
				Macro = { icon = "", hl = "Function" },
			},
		},
	},
}
