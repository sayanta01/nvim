return {
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    -- "b0o/SchemaStore.nvim",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", function()
          Snacks.picker.lsp_references()
        end, { buffer = event.buf, nowait = true })
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
      end,
    })

    vim.diagnostic.config({
      virtual_text = { source = "if_many", prefix = "▪" },
      signs = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { focusable = true, border = "rounded", source = "if_many", prefix = "" },
    })

    local servers = {
      -- clangd = { cmd = { "clangd", "-header-insertion=iwyu" }, },
      -- gopls = {
      --   settings = {
      --     gopls = {
      --       gofumpt = true,
      --       analyses = { unusedparams = true },
      --       usePlaceholders = true,
      --       staticcheck = true,
      --     },
      --   },
      -- },

      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
              checkThirdParty = false,
            },
          },
        },
      },

      pyright = {
        settings = {
          python = {
            analysis = {
              diagnosticMode = "openFilesOnly",
              typeCheckingMode = "basic",
            },
          },
        },
      },

      -- jsonls = {
      -- 	on_new_config = function(new_config)
      -- 		new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      -- 		vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
      -- 	end,
      -- 	settings = {
      -- 		json = {
      -- 			format = { enable = true },
      -- 			validate = { enable = true },
      -- 		},
      -- 	},
      -- },

      vtsls = {
        settings = {
          complete_function_calls = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            maxInlayHintLength = 30,
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      },
    }

    servers.vtsls.settings.javascript =
        vim.tbl_deep_extend("force", {}, servers.vtsls.settings.typescript, servers.vtsls.settings.javascript or {})

    require("mason-lspconfig").setup({
      ensure_installed = vim.list_extend(
        { "bashls", "html", "cssls", "emmet_language_server" },
        vim.tbl_keys(servers)
      ),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
