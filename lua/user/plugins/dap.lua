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
          { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
        },
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

					dapui.setup({
						controls = {
							icons = {
								disconnect = "",
								pause = "󰏨",
								play = "",
								run_last = "",
								step_back = "⮶",
								step_into = "",
								step_out = "",
								step_over = "⮷",
								terminate = "□",
							},
						},
					})

					vim.fn.sign_define(
						"DapBreakpoint",
						{ text = "", texthl = "DiagnosticError", linehl = "", numhl = "" }
					)

					-- configure LLDB
					dap.adapters.lldb = {
						type = "executable",
						command = codelldb_path .. ", " .. liblldb_path,
						name = "lldb",
					}
					-- C, Cpp & rust
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

			{
				"jay-babu/mason-nvim-dap.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					automatic_installation = true,
					ensure_installed = {
						"python",
						"js",
						"codelldb",
						"delve",
						"javadbg",
					},
					-- You can provide additional configuration to the handlers,
					-- see mason-nvim-dap README for more information
					handlers = {},
				},
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
	-- 				-- additional args to pass to dlv
	-- 				args = {},
	-- 				-- the build flags that are passed to delve
	-- 				-- defaults to empty string, but can be used to provide flags
	-- 				-- such as "-tags=unit" to make sure the test suite is
	-- 				-- compiled during debugging, for example
	-- 				-- passing build flags using args is ineffective, as those are
	-- 				-- ignored by delve in dap mode
	-- 				build_flags = "",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
