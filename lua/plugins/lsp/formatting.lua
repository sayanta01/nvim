return {
  "stevearc/conform.nvim",
  event = "BufReadPost",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
        ensure_installed = {
          -- "debugpy",
          -- "codelldb",
          -- "delve",
          -- "js-debug-adapter",
          -- "java-debug-adapter",
          "prettier",
          "shfmt",
          "shellcheck", -- bashls automatically uses
          "stylua",
          "isort",
          "black",
          -- "pylint",
          -- "eslint",
        },
      })
    end,
  },
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      svelte = { "prettier" },
      graphql = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      java = { "google-java-format" },
      go = { "gofmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      sh = { "shfmt" },
      lua = { "stylua" },
      python = { "isort", "black" },
      -- terraform = { "terraform_fmt" },
    },
    -- format_on_save = {
    -- 	timeout_ms = 500,
    -- 	async = true,
    -- 	lsp_fallback = true,
    -- },
  },
}
