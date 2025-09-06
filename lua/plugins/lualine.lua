local u = require "core.utils"
local c = {
  mode = {
    function()
      return " "
    end,
    padding = 0,
  },
  diagnostic = { "diagnostics", sources = { "nvim_diagnostic" } },
  location = { "location", padding = 1, colored = false },
  lsp = {
    function()
      local clients = table.concat(u.lsp.get_clients(), ", ")
      return (#clients == 0 and "") or ("[" .. clients .. "]")
    end,
  },
}

---@type LazySpec
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "NeogitStatus", "lazy" },
    },
    sections = {
      lualine_a = { c.mode },
      lualine_b = {},
      lualine_c = { "filename", "branch", c.diagnostic },
      lualine_x = { c.lsp, "diff" },
      lualine_y = {},
      lualine_z = { c.location },
    },
  },
}
