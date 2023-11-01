return {
	"simrat39/rust-tools.nvim",
	ft = { "rust" },
	config = function()
		local rust_setup, rt = pcall(require, "rust-tools")
		if not rust_setup then
			return
		end

		local mason_registry = require("mason-registry")
		local codelldb = mason_registry.get_package("codelldb")
		codelldb:get_install_path()
		local extension_path = codelldb:get_install_path() .. "/extension/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

		rt.setup({
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				--[[ settings = { ]]
				--[[ 	["rust-analyzer"] = { ]]
				--[[ 		cargo = { ]]
				--[[ 			allFeatures = true, ]]
				--[[ 			loadOutDirsFromCheck = true, ]]
				--[[ 			runBuildScripts = true, ]]
				--[[ 		}, ]]
				--[[ 		procMacro = { ]]
				--[[ 			enable = true, ]]
				--[[ 			ignored = { ]]
				--[[ 				["async-trait"] = { "async_trait" }, ]]
				--[[ 				["napi-derive"] = { "napi" }, ]]
				--[[ 				["async-recursion"] = { "async_recursion" }, ]]
				--[[ 			}, ]]
				--[[ 		}, ]]
				--[[ 		lens = { ]]
				--[[ 			enable = true, ]]
				--[[ 		}, ]]
				--[[ 		checkOnSave = { ]]
				--[[ 			allFeatures = true, ]]
				--[[ 			command = "clippy", ]]
				--[[ 			extraArgs = { "--no-deps" }, ]]
				--[[ 		}, ]]
				--[[ 	}, ]]
				--[[ }, ]]
			},
		})
	end,

	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				src = {
					cmp = {
						enabled = true,
					},
				},
			})
		end,
	},
}
