return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- stylua: ignore
  keys = {
    { "<C-_>",      function() require("toggleterm").toggle() end, desc = "Toggle Terminal" },
    { "<C-/>",      function() require("toggleterm").toggle() end, desc = "Toggle Terminal" },
    { "<leader>gg", ":lua _LAZYGIT_TOGGLE()<cr>",                  desc = "Lazygit" },
  },
  opts = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })

    return {
      size = 12,
    }
  end,
}
