local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

require("nvim-dap-virtual-text").setup()

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end
dapui.setup({
	--[[ sidebar = { ]]
	--[[ 	elements = { ]]
	--[[ 		{ ]]
	--[[ 			id = "scopes", ]]
	--[[ 			size = 0.25, -- Can be float or integer > 1 ]]
	--[[ 		}, ]]
	--[[ 		{ id = "breakpoints", size = 0.25 }, ]]
	--[[ 	}, ]]
	--[[ 	size = 40, ]]
	--[[ 	position = "left", -- Can be "left", "right", "top", "bottom" ]]
	--[[ }, ]]
	--[[ tray = { ]]
	--[[ 	elements = {}, ]]
	--[[ }, ]]
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

--[[ python ]]
--[[ To configure a different runner, change the test_runner variable. For example to configure pytest set the test runner like this in vimL: ]]
--[[ require("dap-python").test_runner = "pytest" ]]
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "My custom launch configuration",
	program = "${file}",
	-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})

--[[ javascript ]]
dap.adapters.node2 = {
	type = "executable",
	command = "node-debug2-adapter",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
	--[[ args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' }, ]]
	--[[ args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'}, ]]
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

--[[ bash ]]
dap.adapters.bashdb = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
	name = "bashdb",
}
dap.configurations.sh = {
	{
		type = "bashdb",
		request = "launch",
		name = "Launch file",
		showDebugOutput = true,
		pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
		pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = "${workspaceFolder}",
		pathCat = "cat",
		pathBash = "/bin/bash",
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		args = {},
		env = {},
		terminalKind = "integrated",
	},
}

--[[ go ]]
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "${file}",
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
--[[ c/c++/rust ]]
--[[ dap.adapters.lldb = { ]]
--[[ 	type = "executable", ]]
--[[ 	command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path ]]
--[[ 	name = "lldb", ]]
--[[ } ]]
--[[ dap.configurations.cpp = { ]]
--[[ 	{ ]]
--[[ 		name = "Launch", ]]
--[[ 		type = "lldb", ]]
--[[ 		request = "launch", ]]
--[[ 		program = function() ]]
--[[ 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") ]]
--[[ 		end, ]]
--[[ 		cwd = "${workspaceFolder}", ]]
--[[ 		stopOnEntry = false, ]]
--[[ 		args = {}, ]]
--[[ 	}, ]]
--[[ } ]]
--[[ dap.configurations.c = dap.configurations.cpp ]]
--[[ dap.configurations.rust = dap.configurations.cpp ]]

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
