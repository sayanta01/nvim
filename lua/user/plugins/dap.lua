return {
	"mfussenegger/nvim-dap",
	cmd = { "DapUIToggle", "DapToggleRepl", "DapToggleBreakpoint" },
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				local dap = require("dap")

				local dapui = require("dapui")

				dapui.setup()

				vim.fn.sign_define(
					"DapBreakpoint",
					{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
				)

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

		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
	},
}
