return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({}) end,       desc = "Dap UI" },
          { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
          { "<leader>de", function() require("dapui").eval() end,           desc = "Evaluate", mode = { "n", "v" } },
        },
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")
					local mason_registry = require("mason-registry")

					local codelldb_path = mason_registry.get_package("codelldb"):get_install_path()
						.. "/extension/adapter/codelldb"
					local js_debug_path = mason_registry.get_package("js-debug-adapter"):get_install_path()

					dapui.setup({
						controls = {
							icons = {
								disconnect = "",
								pause = "⏸",
								play = "",
								run_last = "",
								step_back = "",
								step_into = "",
								step_over = "",
								step_out = "",
								terminate = "",
							},
						},
					})

					vim.fn.sign_define(
						"DapBreakpoint",
						{ text = "", texthl = "DiagnosticError", linehl = "", numhl = "" }
					)

					dap.adapters.codelldb = {
						type = "server",
						port = "${port}",
						executable = {
							command = codelldb_path,
							args = { "--port", "${port}" },
						},
					}

					dap.configurations.cpp = {
						{
							name = "Launch",
							type = "codelldb",
							request = "launch",
							program = function()
								return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
							end,
							cwd = "${workspaceFolder}",
							stopOnEntry = false,
						},
						-- {
						-- 	type = "codelldb",
						-- 	request = "attach",
						-- 	name = "Attach to process",
						-- 	pid = require("dap.utils").pick_process,
						-- 	cwd = "${workspaceFolder}",
						-- },
					}
					dap.configurations.c = dap.configurations.cpp
					dap.configurations.rust = dap.configurations.cpp

					for _, adapter in ipairs({
						"pwa-node",
						"pwa-chrome",
						"pwa-msedge",
						"node-terminal",
						"pwa-extensionHost",
					}) do
						dap.adapters[adapter] = {
							type = "server",
							host = "localhost",
							port = "${port}",
							executable = {
								command = "node",
								args = {
									js_debug_path .. "/js-debug/src/dapDebugServer.js",
									"${port}",
								},
							},
						}
					end

					for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
						dap.configurations[language] = {
							{
								type = "pwa-node",
								request = "launch",
								name = "Launch file",
								program = "${file}",
								cwd = "${workspaceFolder}",
							},
							-- {
							-- 	type = "pwa-node",
							-- 	request = "attach",
							-- 	name = "Attach",
							-- 	processId = require("dap.utils").pick_process,
							-- 	cwd = "${workspaceFolder}",
							-- },
							{
								type = "pwa-chrome",
								request = "launch",
								name = 'Start Chrome with "localhost"',
								url = "http://localhost:3000",
								webRoot = "${workspaceFolder}",
								userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
							},
						}
					end

					dap.listeners.before.attach.dapui_config = function()
						dapui.open()
					end
					dap.listeners.before.launch.dapui_config = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated.dapui_config = function()
						dapui.close()
					end
					dap.listeners.before.event_exited.dapui_config = function()
						dapui.close()
					end
				end,
			},

			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
    -- stylua: ignore
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Test Method", ft = "python" },
      { "<leader>dPc", function() require("dap-python").test_class() end,  desc = "Test Class",  ft = "python" },
    },
		config = function()
			local path = require("mason-registry").get_package("debugpy"):get_install_path()
			require("dap-python").setup(path .. "/venv/bin/python")
		end,
	},

	-- {
	-- 	"leoluz/nvim-dap-go",
	-- 	ft = "go",
	--    -- stylua: ignore
	--    keys = {
	--      { "<leader>dPt", function() require("dap-go").debug_test() end,      desc = "Debug Test", ft = "go" },
	--      { "<leader>dPl", function() require("dap-go").debug_last_test() end, desc = "Last Test",  ft = "go" },
	--    },
	-- 	config = function()
	-- 		require("dap-go").setup({
	-- 			dap_configurations = {
	-- 				{
	-- 					type = "go",
	-- 					name = "Attach remote",
	-- 					mode = "remote",
	-- 					request = "attach",
	-- 				},
	-- 			},
	-- 			delve = {
	-- 				path = "dlv",
	-- 				initialize_timeout_sec = 20,
	-- 				port = "${port}",
	-- 				args = {},
	-- 				build_flags = "",
	-- 				detached = vim.fn.has("win32") == 0,
	-- 				cwd = nil,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
