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
    priority = 1001,
    keys = function()
      local function wrap(mod, fn)
        return function()
          return Snacks[mod][fn]()
        end
      end

      return {
        { "<leader>f", wrap("picker", "files") },
        { "<leader>b", wrap("picker", "buffers") },
        { "<leader>sr", wrap("picker", "recent") },
        { "<leader>sg", wrap("picker", "grep") },
        { "<leader>sd", wrap("picker", "diagnostics") },
        { "<leader>sh", wrap("picker", "help") },
        { "z=", wrap("picker", "spelling") },
      }
    end,
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
