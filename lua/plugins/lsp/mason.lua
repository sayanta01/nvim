return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "jdtls",
        "gopls",
        "clangd",
        "rust_analyzer",
        "bashls",
        "lua_ls",
        "pyright",
        -- "intelephense",
        "html",
        "cssls",
        "tailwindcss",
        "ts_ls",
        "svelte",
        "graphql",
        "emmet_ls",
        "jsonls",
        "yamlls",
        "sqlls",
        "marksman",
        "dockerls",
      },
    })
  end,
}
