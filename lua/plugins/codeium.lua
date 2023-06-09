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
  init = function()
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_manual = 1
    vim.g.codeium_filetypes = {
      ["markdown"] = false,
      ["gitcommit"] = false,
      ["NeogitCommitMessage"] = false,
    }
  end,
}
