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
    ft = { "lua" },
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,
        doc = { inline = false },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      vim.api.nvim_create_user_command("SnacksScratch", function()
        Snacks.scratch()
      end, { nargs = 0 })
    end,
  },
}
