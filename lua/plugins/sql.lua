return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "sql", "mysql", "plsql" },
          callback = function()
            local cmp = require("cmp")

            local sources = vim.tbl_map(function(source)
              return { name = source.name }
            end, cmp.get_config().sources)

            table.insert(sources, { name = "vim-dadbod-completion" })
            cmp.setup.buffer({ sources = sources })
          end,
        })
      end,
    },
  },
  init = function()
    local data_path = vim.fn.stdpath("data")

    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_icons = { expanded = "", collapsed = "›" }
    vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
    vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
    vim.g.db_ui_use_nvim_notify = false
    vim.g.db_ui_execute_on_save = false
  end,
}
