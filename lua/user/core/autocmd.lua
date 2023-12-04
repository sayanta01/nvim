-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "notify", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

-- Set wrap & spell in markdown and gitcommit
--[[ vim.api.nvim_create_autocmd({ "FileType" }, { ]]
--[[ 	pattern = { "gitcommit", "markdown" }, ]]
--[[ 	callback = function() ]]
--[[ 		vim.opt_local.wrap = true ]]
--[[ 		vim.opt_local.spell = true ]]
--[[ 	end, ]]
--[[ }) ]]

-- Disable the concealing in some files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Quit nvimTree when not any file opened
--[[ vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif") ]]

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight Yanked text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Restore last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Json support
local json_group = vim.api.nvim_create_augroup("Json", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	command = [[syntax match Comment +\/\/.\+$+]],
	group = json_group,
	pattern = "*.json",
})

-- Comment function for json
vim.cmd("au! BufRead,BufNewFile *.json set filetype=jsonc")
