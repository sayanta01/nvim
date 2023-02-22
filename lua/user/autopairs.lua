local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup({
	check_ts = true, -- treesitter integration
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false, -- don't check treesitter on java
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
	enable_moveright = true,
	-- disable when recording or executing a macro
	disable_in_macro = false,
	-- add bracket pairs after quote
	enable_afterquote = true,
	-- map the <BS> key
	map_bs = true,
	-- map <c-w> to delete a pair if possible
	map_c_w = false,
	-- disable when insert after visual block mode
	disable_in_visualblock = false,
	-- change default fast_wrap
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
