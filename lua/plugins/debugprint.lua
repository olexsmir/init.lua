return {
  "andrewferrier/debugprint.nvim",
  config = true,
  keys = {
    {
      "<leader>P",
      function()
        return require("debugprint").debugprint { variable = true }
      end,
      expr = true,
    },
  },
}
