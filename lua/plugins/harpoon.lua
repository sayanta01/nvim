return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
  -- stylua: ignore
  keys = {
    {
      "<leader>hh",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Menu"
    },
    { "<leader>h",  "",                                              desc = "Harpoon" },
    { "<leader>hm", function() require("harpoon"):list():add() end,  desc = "Mark to Harpoon", },
    { "<leader>hn", function() require("harpoon"):list():next() end, desc = "Next", },
    { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Prev", },
  },
}
