return {
	-- {
	-- 	"NvChad/nvim-colorizer.lua",
	-- 	cmd = "ColorizerToggle",
	-- 	opts = {
	-- 		user_default_options = {
	-- 			names = false,
	-- 			-- RRGGBBAA = false,
	-- 			-- AARRGGBB = false, -- 0xAARRGGBB hex codes
	-- 			-- rgb_fn = false,
	-- 			-- hsl_fn = false,
	-- 			tailwind = true,
	-- 		},
	-- 	},
	-- },

	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual",
			virtual_symbol = "■",
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},
}
