return {
  "3rd/image.nvim",
  ft = { "markdown", "conf" },
  opts = {
    backend = "kitty",
    kitty_method = "normal",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        only_render_image_at_cursor = true,
        filetypes = { "markdown", "conf" },
      },
    },
    max_width_window_percentage = nil,
    max_height_window_percentage = 80,
  },
}
