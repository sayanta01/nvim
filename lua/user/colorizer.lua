require("colorizer").setup({
	filetypes = {
		--[[ "*", ]]
		"sh",
		"lua",
		"astro",
		"typescript",
		"typescriptreact",
		"javascript",
		"html",
		"css",
		css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
		html = { names = true }, -- Disable parsing "names" like Blue or Gray
		"!popup",
		"!prompt",
		"!lazy", -- Exclude vim from highlighting.
	},
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		names = true,
		RRGGBBAA = false,
		AARRGGBB = false,
		rgb_fn = false,
		hsl_fn = false,
		css = false,
		css_fn = false,
		-- Available modes for `mode`: foreground, background,  virtualtext
		mode = "background", -- Set the display mode.
		-- Available methods are false / true / "normal" / "lsp" / "both"
		-- True is same as normal
		tailwind = false, -- `both`
		sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
		virtualtext = "■",
	},
	-- all the sub-options of filetypes apply to buftypes
	buftypes = {},
})
