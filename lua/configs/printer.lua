require("core.utils").map("n", "<leader>p", "<Plug>(printer_print)iw")

require("printer").setup {
  keymap = "gp",
  formatters = {
    lua = function(inside, variable)
      return string.format([[vim.pretty_print("%s: " .. %s)]], inside, variable)
    end,
  },
}
