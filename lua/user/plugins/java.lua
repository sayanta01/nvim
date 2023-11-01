return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	config = function()
		-- More space in the neovim command line for displaying messages
		-- Use this function notation to build some variables
		--[[ vim.opt_local.tabstop = 4 ]]
		--[[ vim.opt_local.shiftwidth = 4 ]]
		--[[ vim.opt_local.softtabstop = 4 ]]
		--[[ vim.opt_local.ts = 4 ]]
		--[[ vim.opt_local.expandtab = true ]]

		local status, jdtls = pcall(require, "jdtls")
		if not status then
			return
		end

		-- Determine OS
		local os
		if vim.fn.has("macunix") then
			os = "mac"
		elseif vim.fn.has("win32") then
			os = "win"
		else
			os = "linux"
		end

		-- Find root of project
		local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
		local root_dir = require("jdtls.setup").find_root(root_markers)
		if root_dir == "" then
			return
		end

		local extendedClientCapabilities = jdtls.extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

		-- Calculate workspace dir
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Get the mason install path
		local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

		local bundles = {}
		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
		vim.list_extend(
			bundles,
			vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n")
		)

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-javaagent:" .. install_path .. "/lombok.jar",
				"-Xms1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				install_path .. "/config_" .. os,
				"-data",
				workspace_dir,
			},

			capabilities = capabilities,
			root_dir = root_dir,

			settings = {
				java = {},
			},

			init_options = {
				bundles = {
					vim.fn.glob(
						mason_path
							.. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
						"\n"
					),
				},
			},
		}

		vim.list_extend(
			bundles,
			vim.split(
				vim.fn.glob(
					mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
				),
				"\n"
			)
		)

		config["on_attach"] = function(client, bufnr)
			local _, _ = pcall(vim.lsp.codelens.refresh)
			require("jdtls.dap").setup_dap_main_class_configs()
			jdtls.setup_dap({ hotcodereplace = "auto" })
			require("user.lsp.handlers").on_attach(client, bufnr)
		end

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = { "*.java" },
			callback = function()
				local _, _ = pcall(vim.lsp.codelens.refresh)
			end,
		})

		jdtls.start_or_attach(config)

		--[[ vim.cmd( ]]
		-- [[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
		--[[ ) ]]

		-- Shorten function name
		local keymap = vim.keymap.set
		-- Silent keymap option
		local opts = { silent = true }

		keymap("n", "<leader>ji", ":lua require'jdtls'.organize_imports()<CR>", opts)
		keymap("n", "<leader>jt", ":lua require'jdtls'.test_class()<CR>", opts)
		keymap("n", "<leader>jn", ":lua require'jdtls'.test_nearest_method()<CR>", opts)
		keymap("n", "<leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
		keymap("n", "<leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
		keymap("v", "<leader>jm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
		keymap("v", "<leader>jv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
		keymap("v", "<leader>jc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
	end,
}
