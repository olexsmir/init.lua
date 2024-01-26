local map = require("core.utils").smap
return {
  {
    "echasnovski/mini.bufremove",
    config = true,
    keys = {
      { "<leader>c", map("mini.bufremove", "delete", "0, false") },
    },
  },
  {
    "echasnovski/mini.comment",
    config = true,
    keys = {
      { "gc", mode = { "n", "v" } },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    config = true,
    keys = {
      { "gS", mode = { "n", "v" } },
    },
  },
}
