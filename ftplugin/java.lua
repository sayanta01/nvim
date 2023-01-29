--[[ https://github.com/mfussenegger/nvim-jdtls ]]
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

-- Determine OS
local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "linux"
else
	print("Unsupported system")
end

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

--[[ local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t") ]]
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

JAVA_DAP_ACTIVE = true

local bundles = {
	vim.fn.glob(
		home .. "/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
	),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/vscode-java-test/server/*.jar"), "\n"))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx1G",
		--[[ "-jar", ]]
		--[[ "~/Library/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar", ]]
		--[[ "-jar", ]]
		--[[ vim.fn.glob(home .. "/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"), ]]
		--[[ "-configuration", ]]
		--[[ "~/Library/java/jdt-language-server-1.9.0-202203031534/config_linux", ]]
		--[[ "-configuration", ]]
		--[[ home .. "/.local/share/nvim/lsp_servers/jdtls/config_" .. CONFIG, ]]

		"-jar",
		"~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"~/.local/share/nvim/mason/packages/jdtls/config_linux",

		--[[ "-data", ]]
		--[[ vim.fn.expand("~/.cache/jdtls/workspace") .. workspace_dir, ]]
		"-data",
		workspace_dir,
	},

	capabilities = capabilities,

	root_dir = root_dir,
	--[[ root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }), ]]

	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			-- Set this to true to use jdtls as your formatter
			format = {
				enabled = false,
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},
	flags = {
		allow_incremental_sync = true,
	},
}
require("jdtls").start_or_attach(config)

vim.cmd(
	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
)
vim.cmd(
	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
)
vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("n", "<leader>ji", ":lua require'jdtls'.organize_imports()<CR>", opts)
keymap("n", "<leader>jt", ":lua require'jdtls'.test_class()<CR>", opts)
keymap("n", "<leader>jn", ":lua require'jdtls'.test_nearest_method()<CR>", opts)
keymap("n", "<leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
keymap("n", "<leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
keymap("n", "<leader>ju", ":JdtUpdateConfig<CR>", opts)

keymap("v", "<leader>jm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
keymap("v", "<leader>jv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
keymap("v", "<leader>jc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
