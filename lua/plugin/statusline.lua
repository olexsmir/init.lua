local M = {}

function M.setup()
  require("lualine").setup {
    options = {
      theme = "onenord",
      component_separators = { "", "" },
      section_separators = { "", "" },
      disabled_filetypes = { "NvimTree", "Telescope" },
      always_divide_middle = false,
    },
    sections = {
      lualine_a = { "branch" },
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = { "diff" },
      lualine_y = { { "diagnostics", sources = { "nvim_diagnostic" } } },
      lualine_z = { "location" },
    },
  }
end

return M
