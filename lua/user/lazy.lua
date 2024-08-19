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
	change_detection = {
		enabled = false,
		notify = false,
	},
	ui = {
		border = "rounded",
		icons = {
			cmd = "",
			config = "",
			ft = "",
			init = "",
			import = "",
			keys = "",
			not_loaded = "",
			plugin = "",
			source = "",
			start = "",
			task = "",
			list = {
				"●",
				"",
				"",
				"",
			},
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zip",
				"zipPlugin",
				"lazyredraw",
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"logipat",
				"netrwSettings",
				"netrwFileHandlers",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
				"health",
			},
		},
	},
})
