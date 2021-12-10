local M = {}

function M.setup()
  require("lualine").setup {
    options = {
      theme = "catppuccin",
      component_separators = { "", "" },
      section_separators = { "", "" },
      disabled_filetypes = { "NvimTree", "Telescope" },
    },
    sections = {
      lualine_a = { "branch", "diff" },
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { { "diagnostics", sources = { "nvim_diagnostic" } } },

      lualine_z = { "location" },
    },
  }
end

return M
