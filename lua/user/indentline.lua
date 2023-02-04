require("indent_blankline").setup({
	buftype_exclude = {
		"nofile",
		"terminal",
	},
	filetype_exclude = {
		"help",
		"alpha",
		"packer",
		"lazy",
		"NvimTree",
		"text",
		--[[ "dashboard", ]]
		--[[ "aerial", ]]
		--[[ "Trouble", ]]
	},
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	--[[ char = "▏", ]]
	--[[ char = "│", ]]
	--[[ char = "┆", ]]
	--[[ char = ":", ]]
	--[[ char = "∘", ]]
	char = "",
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
	--[[ context_char = "▏", ]]
	show_current_context_start = false,
})
