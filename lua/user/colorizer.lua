local options = {
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
	names = true,
	RGB = true,
	RRGGBB = true,
	RRGGBBAA = true,
}
require("colorizer").setup({
	"css",
	"javascript",
	"*",
	"!lazy", -- Exclude vim from highlighting.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = true }, -- Disable parsing "names" like Blue or Gray
}, options)
