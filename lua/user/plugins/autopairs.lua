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
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
			enable_moveright = true,
			-- disable when recording or executing a macro
			disable_in_macro = false,
			-- add bracket pairs after a quote
			enable_afterquote = true,
			-- map the <BS> key
			map_bs = true,
			-- map <c-w> to delete a pair if possible
			map_c_w = false,
			-- disable when inserting after visual block mode
			disable_in_visualblock = false,
			-- change default fast_wrap
		})

		-- import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end

		-- make autopairs and completion work together
		--[[ 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) ]]
		cmp.setup({
			event = {
				on_confirm_done = cmp_autopairs.on_confirm_done(),
			},
			-- other cmp configurations
		})
	end,
}
