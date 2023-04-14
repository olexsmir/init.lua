local map = require("core.utils").smap
return {
  "ThePrimeagen/harpoon",
  config = true,
  keys = {
    { "<leader>a", map("harpoon.mark", "add_file") },
    { "<leader>1", map("harpoon.ui", "toggle_quick_menu") },
    { "<leader>3", map("harpoon.ui", "nav_file", "1") },
    { "<leader>4", map("harpoon.ui", "nav_file", "2") },
    { "<leader>5", map("harpoon.ui", "nav_file", "3") },
    { "<leader>6", map("harpoon.ui", "nav_file", "4") },
  },
}
