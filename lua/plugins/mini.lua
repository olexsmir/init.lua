return {
  {
    "echasnovski/mini.bufremove",
    config = true,
    keys = {
      {
        "<leader>c",
        function()
          require("mini.bufremove").delete()
        end,
      },
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
