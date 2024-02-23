return {
	"mfussenegger/nvim-dap",
	cmd = { "DapUIToggle", "DapToggleRepl", "DapToggleBreakpoint" },
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				local dap = require("dap")

				local dapui = require("dapui")

				-- CodeLLDB debug adapter location
				local mason_registry = require("mason-registry")
				local codelldb = mason_registry.get_package("codelldb")
				codelldb:get_install_path()
				local extension_path = codelldb:get_install_path() .. "/extension/"
				local codelldb_path = extension_path .. "adapter/codelldb"
				local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

				dapui.setup()

				vim.fn.sign_define(
					"DapBreakpoint",
					{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
				)

				-- configure LLDB adapter
				dap.adapters.lldb = {
					type = "executable",
					command = codelldb_path .. ", " .. liblldb_path,
					name = "lldb",
				}

				-- default debug configuration for C, C++ & rust
				dap.configurations.c = {
					{
						name = "Launch file",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
				}

				dap.configurations.cpp = dap.configurations.c
				dap.configurations.rust = dap.configurations.c

				-- JS
				dap.adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = 8123,
					executable = {
						command = "js-debug-adapter",
					},
				}

				for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
					dap.configurations[language] = {
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
							runtimeExecutable = "node",
						},
					}
				end

				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end,
		},

		-- virtual text for debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},

		{
			"jay-babu/mason-nvim-dap.nvim",
			-- cmd = { "DapInstall", "DapUninstall" },
			opts = {
				automatic_installation = true,
				ensure_installed = {
					"python",
					"codelldb",
					"delve",
					"js",
					"javadbg",
				},
				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},
			},
		},
	},
}
