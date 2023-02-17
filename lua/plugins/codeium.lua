return {
  "Exafunction/codeium.vim",
  cmd = "Codeium",
  event = "InsertEnter",
  keys = {
    { "<C-;>", vim.fn["codeium#Accept"], mode = "i", expr = true },
    {
      "<C-,>",
      function()
        return vim.fn["codeium#CycleCompletions"](1)
      end,
      mode = "i",
      expr = true,
    },
    {
      "<C-.>",
      function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end,
      mode = "i",
      expr = true,
    },
  },
  config = function()
    vim.g.codeium_disable_bindings = 1
  end,
}
