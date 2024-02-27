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
	defaults = { lazy = true }, -- lazy-load all plugins by default
	install = {
		colorscheme = { "habamax" },
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		notify = false,
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = false,
		notify = false,
	},
	ui = {
		border = "rounded",
		icons = {
			config = " ",
			event = "🗲 ",
			init = " ",
			import = " ",
			keys = "󰥻 ",
			plugin = " ",
			source = " ",
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
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			-- disable some rtp plugins
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
