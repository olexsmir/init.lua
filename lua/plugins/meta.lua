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
    priority = 1000,
    keys = {
      { "<leader>f", "<cmd>lua Snacks.picker.files()<cr>" },
      { "<leader>b", "<cmd>lua Snacks.picker.buffers()<cr>" },
      { "<leader>sr", "<cmd>lua Snacks.picker.recent()<cr>" },
      { "<leader>sg", "<cmd>lua Snacks.picker.grep()<cr>" },
      { "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<cr>" },
      { "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>" },
      { "z=", "<cmd>lua Snacks.picker.spelling()<cr>" },
    },
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,
        doc = { inline = false },
      },
      picker = {
        enabled = true,
        layout = {
          preset = "ivy",
          layout = {
            height = 25,
          },
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
              ["<C-k>"] = { "" },
              ["<C-j>"] = { "" },
            },
          },
        },
        sources = {
          select = { layout = { preset = "ivy" } },
          spelling = { layout = { preset = "ivy" } },
        },
      },
    },
  },
}
