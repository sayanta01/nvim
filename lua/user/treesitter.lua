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
		"python",
		"bash",
		"awk",
		"json",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"php",
		"sql",
		"go",
		"rust",
		"markdown",
		"markdown_inline",
		"java",
		"dockerfile",
		"gitignore",
		"regex",
		"yaml",
		-- "kotlin",
		-- "ruby",
		-- "graphql",
		-- "svelte",
		-- "solidity",
		-- "astro",
		-- "vue",
		-- "scss",
		-- "latex",
		-- "prisma",
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
	autotag = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	auto_install = true,
})
