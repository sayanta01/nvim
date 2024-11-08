local function augroup(name)
	return vim.api.nvim_create_augroup("lazyVim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"notify",
		"qf",
		"spectre_panel",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"DressingSelect",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("wrap_spell"),
	pattern = { "text", "gitcommit", "markdown", "conf" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("concealing_means_hidden"),
	pattern = { "json", "jsonc", "json5", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Don't auto comment new line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = augroup("useful"),
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

-- Comment json
vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")
