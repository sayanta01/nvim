return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  keys = {
    { "<leader>e", ":NvimTreeToggle<cr>", desc = "Explorer" },
  },
  config = function()
    local nvimtree = require("nvim-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      filters = { dotfiles = true },
      hijack_cursor = true,
      disable_netrw = true,
      sync_root_with_cwd = true,
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "▏",
            edge = "▏",
            item = "▏",
            bottom = "",
          },
        },
        icons = {
          git_placement = "after",
          symlink_arrow = "  ",
          glyphs = {
            default = "",
            symlink = "󰌷",
            bookmark = "",
            folder = {
              arrow_closed = "›",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "󰜌",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "⊡",
              staged = "",
              unmerged = "",
              renamed = "✎",
              untracked = "∪",
              deleted = "",
              ignored = "",
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })
  end,
}
