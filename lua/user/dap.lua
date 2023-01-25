local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

require("nvim-dap-virtual-text").setup()
dap_install.setup({})

dap_install.config("python", {
	require("dap-python").setup("/path/to/python"),
	table.insert(require("dap").configurations.python, {
		type = "python",
		request = "launch",
		name = "My custom launch configuration",
		program = "${file}",
		-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
	}),
})

dapui.setup({
	layouts = {
		elements = {
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
		},
		size = 40,
		position = "right", -- Can be "left", "right", "top", "bottom"
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

-- ADAPTERS
dap.adapters.node2 = {
	type = "executable",
	command = "node-debug2-adapter",
	--[[ args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'}, ]]
	--[[ args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' }, ]]
	args = {},
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
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		restart = true,
		-- port = 9229
		processId = require("dap.utils").pick_process,
	},
}

dap.adapters.ruby = {
	type = "executable",
	command = "bundle",
	args = { "exec", "readapt", "stdio" },
}

dap.configurations.ruby = {
	{
		type = "ruby",
		request = "launch",
		name = "Rails",
		program = "bundle",
		programArgs = { "exec", "rails", "s" },
		useBundler = true,
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
