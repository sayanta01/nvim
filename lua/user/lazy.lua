local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "user.plugins" }, { import = "user.plugins.lsp" } }, {
	--[[ install = { ]]
	--[[ 	colorscheme = { "nightfly" }, ]]
	--[[ }, ]]
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	ui = {
		border = "rounded",
		icons = {
			config = "",
			event = "",
			init = " ",
			import = " ",
			start = "|>",
			task = " ",
			list = {
				"●",
				"",
				"",
				"‒",
			},
		},
	},
})
