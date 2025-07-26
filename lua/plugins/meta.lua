---@type LazySpec
return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>c",
        function()
          require("mini.bufremove").delete()
        end,
      },
      { "gS", mode = { "n", "v" } },
      { "a", mode = { "o", "x" } },
      { "i", mode = { "o", "x" } },
    },
    config = function()
      require("mini.bufremove").setup { silent = true }
      require("mini.splitjoin").setup {}
      require("mini.pairs").setup {}
      require("mini.ai").setup {}
      require("mini.icons").setup {}
      require("mini.test").setup {}
    end,
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
      words = {
        enabled = true,
        debounce = 100,
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
