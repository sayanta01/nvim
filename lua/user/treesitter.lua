local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
configs.setup({
	--[[ ensure_installed = "all", ]]
	ensure_installed = {
		"c",
		"cpp",
		"c_sharp",
		"go",
		"java",
		"javascript",
		"json",
		"lua",
		"python",
		"ruby",
		"rust",
		"typescript",
		"tsx",
		"vue",
		"markdown",
		"markdown_inline",
		"graphql",
		"html",
		"css",
		"scss",
		"php",
		"sql",
		"dockerfile",
		"bash",
		"latex",
		"yaml",
		"vim",
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
