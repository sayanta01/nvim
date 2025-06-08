return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPost",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
      },
    })

    local mr = require("mason-registry")
    mr.refresh(function()
      for _, tool in ipairs({ "prettier", "stylua", "shellcheck", "shfmt", "isort", "black" }) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
