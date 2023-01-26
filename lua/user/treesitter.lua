local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
configs.setup({
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"c",
		"cpp",
		"javascript",
		"rust",
		"typescript",
		"lua",
		"dockerfile",
		"css",
		"json",
		"php",
		"tsx",
		"python",
		"bash",
		"html",
		"regex",
	},
	sync_install = false,
	ignore_install = { "" },
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
