local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

-- use {['"( left side surround to add space
surround.setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "ss",
		normal_line = "yS",
		normal_cur_line = "SS",
		visual = "s",
		visual_line = "gS",
		delete = "ds",
		change = "cs", -- cst <change tags>
		change_line = "cS",
	},
})
