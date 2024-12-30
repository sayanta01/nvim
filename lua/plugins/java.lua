return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4

		local jdtls = require("jdtls")
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local home = os.getenv("HOME")
		local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name
		local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
		local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
		local sysname = vim.fn.system("uname -s"):gsub("\n", ""):lower()
		local config_dir = jdtls_path .. "/config_" .. sysname
		local lombok_path = jdtls_path .. "/lombok.jar"

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-javaagent:" .. lombok_path,
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				launcher_jar,
				"-configuration",
				config_dir,
				"-data",
				workspace_dir,
			},

			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			init_options = {
				bundles = {
					vim.fn.glob(
						home
							.. "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
						true
					),
				},
			},
		}

		config["on_attach"] = function(client, bufnr)
			-- require("plugins.lsp.lsp-config").on_attach(client, bufnr)
			-- pcall(vim.lsp.codelens.refresh)
			jdtls.setup_dap({ hotcodereplace = "auto" })
			require("jdtls.dap").setup_dap_main_class_configs()
		end

		require("jdtls").start_or_attach(config)

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		keymap("n", "<leader>ji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
		keymap("n", "<leader>jv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
		keymap("v", "<leader>jv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
		keymap("n", "<leader>jc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
		keymap("v", "<leader>jc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
		keymap("v", "<leader>jm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
		-- Dap
		keymap("n", "<leader>jt", ":lua require'jdtls'.test_class()<CR>", opts)
		keymap("n", "<leader>jn", ":lua require'jdtls'.test_nearest_method()<CR>", opts)
	end,
}