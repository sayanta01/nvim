return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local status, jdtls = pcall(require, "jdtls")
		if not status then
			return
		end

		local config = {
			cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
			init_options = {
				bundles = {
					vim.fn.glob(
						"~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
						1
					),
				},
			},
		}

		config["on_attach"] = function(client, bufnr)
			local _, _ = pcall(vim.lsp.codelens.refresh)
			require("jdtls.dap").setup_dap_main_class_configs()
			jdtls.setup_dap({ hotcodereplace = "auto" })
			require("user.plugins.lsp.lspconfig").on_attach(client, bufnr)
		end

		require("jdtls").start_or_attach(config)

		local keymap = vim.keymap.set
		local opts = { silent = true }

		keymap("n", "<leader>ji", ":lua require'jdtls'.organize_imports()<CR>", opts)
		keymap("n", "<leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
		keymap("v", "<leader>jv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
		keymap("n", "<leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
		keymap("v", "<leader>jc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
		keymap("v", "<leader>jm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

		-- Dap
		keymap("n", "<leader>jt", ":lua require'jdtls'.test_class()<CR>", opts)
		keymap("n", "<leader>jn", ":lua require'jdtls'.test_nearest_method()<CR>", opts)
	end,
}
