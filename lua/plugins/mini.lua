return {
  {
    "echasnovski/mini.bufremove",
    config = true,
    keys = {
      {
        "<leader>c",
        function()
          require("mini.bufremove").delete(0, false)
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
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_user_command("MiniFiles", function()
        -- selene: allow(undefined_variable)
        MiniFiles.open()
      end, {})
    end,
    opts = {
      mappings = {
        synchronize = "<leader>w",
      },
      options = {
        permanent_delete = false,
      },
    },
  },
}
