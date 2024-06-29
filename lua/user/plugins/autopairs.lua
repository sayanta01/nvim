return {
	"windwp/nvim-autopairs", -- works w/cmp & treesitter
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
				javascript = { "string", "template_string" },
				java = false, -- don't check treesitter on java
			},

			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			fast_wrap = {
				map = "<M-e>",
				pattern = [=[[%'%"%>%]%)%}%,]]=],
			},
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
