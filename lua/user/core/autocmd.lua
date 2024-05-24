local function augroup(name)
	return vim.api.nvim_create_augroup("lazyVim_" .. name, { clear = true })
end

-- Close some filetypes with `q`
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"checkhealth",
		"DressingSelect",
	},
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
		vim.opt_local.buflisted = false
	end,
})

-- Set wrap & spell
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	group = augroup("wrap_spell"),
-- 	pattern = { "gitcommit", "markdown", "conf" },
-- 	callback = function()
-- 		vim.opt_local.spell = true
-- 	end,
-- })

-- Fix concealing
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("concealing_means_hidden"),
	pattern = { "json", "jsonc", "json5", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Don't auto comment new line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = augroup("very_useful"),
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Restore cursor last position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Comment Json
vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")
