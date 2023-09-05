local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

dapui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

--[[ javascript ]]
dap.adapters.node2 = {
	type = "executable",
	command = "node-debug2-adapter",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag
		name = "Attach to process",
		type = "node2",
		request = "attach",
		--[[ restart = true, ]]
		port = 9229,
		processId = require("dap.utils").pick_process,
	},
}

--[[ require("dap-go").setup({ ]]
--[[ 	dap_configurations = { ]]
--[[ 		{ ]]
--[[ 			type = "go", ]]
--[[ 			name = "Attach remote", ]]
--[[ 			mode = "remote", ]]
--[[ 			request = "attach", ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ 	delve = { ]]
--[[ 		initialize_timeout_sec = 20, ]]
--[[ 		port = "${port}", ]]
--[[ 	}, ]]
--[[ }) ]]

-- go
--[[ dap.adapters.delve = { ]]
--[[ 	type = "server", ]]
--[[ 	port = "${port}", ]]
--[[ 	executable = { ]]
--[[ 		command = "dlv", ]]
--[[ 		args = { "dap", "-l", "127.0.0.1:${port}" }, ]]
--[[ 	}, ]]
--[[ } ]]
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md

--[[ dap.configurations.go = { ]]
--[[ 	{ ]]
--[[ 		type = "delve", ]]
--[[ 		name = "Debug", ]]
--[[ 		request = "launch", ]]
--[[ 		program = "${file}", ]]
--[[ 	}, ]]
--[[ 	{ ]]
--[[ 		type = "delve", ]]
--[[ 		name = "Debug test", -- configuration for debugging test files ]]
--[[ 		request = "launch", ]]
--[[ 		mode = "test", ]]
--[[ 		program = "${file}", ]]
--[[ 	}, ]]
-- works with go.mod packages and sub packages
--[[ 	{ ]]
--[[ 		type = "delve", ]]
--[[ 		name = "Debug test (go.mod)", ]]
--[[ 		request = "launch", ]]
--[[ 		mode = "test", ]]
--[[ 		program = "./${relativeFileDirname}", ]]
--[[ 	}, ]]
--[[ } ]]

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
