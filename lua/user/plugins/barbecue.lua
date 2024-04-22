return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	event = { "BufReadPost", "VeryLazy" },
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	opts = {
		exclude_filetypes = { "netrw", "toggleterm" },
		show_basename = false,
		kinds = {
			File = "",
			Module = "󱒌",
			Namespace = "",
			Package = "",
			Class = "",
			Method = "",
			Property = "",
			Field = "",
			Constructor = "",
			Enum = "ℰ",
			Interface = "",
			Function = "ƒ",
			Variable = "",
			Constant = "П",
			String = "",
			Number = "󰎠",
			Boolean = "",
			Array = "",
			Object = "⦿", -- 
			Key = "",
			Null = "",
      EnumMember = "",
			Struct = "",
			Event = "🗲",
			Operator = "󰦒",
			TypeParameter = "",
		},
	},
}
