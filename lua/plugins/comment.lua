return {
  "numToStr/Comment.nvim",
  -- stylua: ignore
  keys = {
    { "gcc",       mode = "n",                                                                 desc = "Toggle Comment" },
    { "gc",        mode = "v",                                                                 desc = "Toggle Comment" },
    { "<leader>/", function() require("Comment.api").toggle.linewise.current() end,            mode = { "n" },         desc = "Toggle Comment" },
    { "<leader>/", function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end, mode = { "v" },         desc = "Toggle Comment" },
  },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      enable_autocmd = false,
      pre_hook = ts_context_commentstring.create_pre_hook(), -- tsx/jsx
    })
  end,
}
