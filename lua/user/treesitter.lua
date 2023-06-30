local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	--[[ ensure_installed = "all", ]]
	ensure_installed = {
		"yaml",
		"c",
		"cpp",
		"c_sharp",
		"go",
		"java",
		"javascript",
		"json",
		"lua",
		"python",
		"rust",
		"typescript",
		"tsx",
		"vue",
		"markdown",
		"markdown_inline",
		"html",
		"css",
		"scss",
		"php",
		"sql",
		"dockerfile",
		"bash",
		"regex",
		"awk",
		"gitignore",
		"kotlin",
    "latex",
    "ruby",
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
