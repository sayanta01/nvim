local function augroup(name)
	return vim.api.nvim_create_augroup("LV_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"help",
		"notify",
		"qf",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Don't auto comment new line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = augroup("useful"),
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
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

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("concealed_means_hidden"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc") -- Comment json
