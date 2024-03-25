return {
	"NvChad/nvim-colorizer.lua",
	cmd = "ColorizerToggle",
	config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = false,
				AARRGGBB = false, -- 0xAARRGGBB hex codes
				rgb_fn = false,
				hsl_fn = false,
				css = false,
				css_fn = false,
				mode = "background", -- Set the display mode
				tailwind = true,
				sass = { enable = false, parsers = { "css" } },
				virtualtext = "",
				always_update = false,
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		})
	end,
}
