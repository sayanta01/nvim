return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { "<S-h>",     "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>",     "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<S-Left>",  "<cmd>BufferLineMovePrev<cr>",  desc = "Move buffer to Left" },
    { "<S-Right>", "<cmd>BufferLineMoveNext<cr>",  desc = "Move buffer to Right" },
  },
  opts = {
    options = {
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      modified_icon = "",
      left_trunc_marker = "‹",
      right_trunc_marker = "›",
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "center",
        },
      },
      separator_style = "thin",
      always_show_bufferline = false,
    },
  },
}
