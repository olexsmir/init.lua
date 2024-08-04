---@type LazySpec
return {
  {
    "echasnovski/mini.bufremove",
    opts = { silent = true },
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
    keys = {
      { "gS", mode = { "n", "v" } },
    },
  },
  {
    "echasnovski/mini.ai",
    config = true,
    keys = {
      { "a", mode = { "o", "x" } },
      { "i", mode = { "o", "x" } },
    },
  },
  {
    "echasnovski/mini.test",
    config = true,
    ft = "lua",
  },
}
