return {
	"windwp/nvim-autopairs", -- autopairs, integrates with cmp & treesitter
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true, -- treesitter integration
			ts_config = {
				lua = { "string", "source" }, -- it will not add a pair on that treesitter node
				javascript = { "string", "template_string" }, -- don't add pairs
				java = false, -- don't check treesitter on java
			},

			disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
			disable_in_macro = false, -- disable when recording or executing a macro
			disable_in_visualblock = false, -- disable when inserting after visual block mode
			disable_in_replace_mode = true,
			ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
			enable_moveright = true,
			enable_afterquote = true, -- add bracket pairs after a quote
			map_bs = true, -- Map the <BS> key
			map_c_h = false, -- Map the <C-h> key to delete a pair
			map_c_w = false, -- Map <C-w> to delete a pair if possible

			fast_wrap = {
				map = "<M-e>", -- Useful
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		-- import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) -- make autopairs and completion work together
	end,
}
