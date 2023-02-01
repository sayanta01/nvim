local options = {
	RGB = true,
	RRGGBB = true,
	RRGGBBAA = true,
	AARRGGBB = false, -- 0xAARRGGBB hex codes
	names = true,
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
	--[[ virtualtext = "■", ]]
}
require("colorizer").setup({
	--[[ "*",  -- Enable for all ]]
	"html",
	"css",
	"javascript",
	"lua",
	"sh",
	"!lazy", -- Exclude vim from highlighting.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = true }, -- Disable parsing "names" like Blue or Gray
}, options)
