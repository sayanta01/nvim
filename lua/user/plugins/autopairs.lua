return {
	-- replace with `altermo/ultimate-autopair.nvim`
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
				lua = { "string" }, -- don't add pairs in lua string treesitter node
				javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter node
				java = false, -- don't check treesitter on java
			},

			disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
			disable_in_macro = false, -- disable when recording or executing a macro
			disable_in_visualblock = false, -- disable when inserting after visual block mode
			enable_moveright = true,
			enable_afterquote = true, -- add bracket pairs after a quote
			map_bs = true, -- map the <BS> key
			map_c_h = false, -- Map the <C-h> key to delete a pair
			map_c_w = false, -- map <c-w> to delete a pair if possible

			-- change default fast_wrap
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

		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end

		-- make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
