local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	--[[ ensure_installed = "all", ]]
	ensure_installed = {
		"yaml",
		"json",
		"c",
		"cpp",
		"c_sharp",
		"java",
		"kotlin",
		"go",
		"rust",
		"python",
		"lua",
		"html",
		"css",
		--[[ "scss", ]]
		"php",
		"sql",
		"javascript",
		"typescript",
		"tsx",
		"vue",
		"latex",
		"markdown",
		"markdown_inline",
		"bash",
		"regex",
		"awk",
		"dockerfile",
		"gitignore",
		--[[ "ruby", ]]
		--[[ "solidity", ]]
		--[[ "astro", ]]
		--[[ "vim", ]]
	},
	sync_install = false,
	ignore_install = {},
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
