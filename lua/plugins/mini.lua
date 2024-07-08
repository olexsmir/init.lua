---@type LazySpec
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
    "echasnovski/mini.splitjoin",
    config = true,
    keys = { { "gS", mode = { "n", "v" } } },
  },
}
