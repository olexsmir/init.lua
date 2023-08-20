local map = require("core.utils").smap
return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>c", map("mini.bufremove", "delete", "0, false") },
    },
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        delay = 10,
        animation = function(_, _)
          return 1
        end,
      },
    },
  },
}
