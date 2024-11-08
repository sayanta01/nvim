return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { "<leader>h", desc = "Harpoon" },
    { "<leader>hh", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Menu", },
    { "<leader>hm", function() require("harpoon"):list():add() end,                                                 desc = "Mark to Harpoon", },
    { "<leader>hn", function() require("harpoon"):list():next() end,                                                desc = "Next", },
    { "<leader>hp", function() require("harpoon"):list():prev() end,                                                desc = "Prev", },
  },
}
