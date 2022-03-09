require("lualine").setup {
  options = {
    theme = "tokyonight",
    component_separators = { "", "" },
    section_separators = { "", "" },
    disabled_filetypes = { "NvimTree", "Telescope" },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = { "filename" },
    lualine_b = { "branch", "diff" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { "diagnostics", sources = { "nvim_diagnostic" } } },
    lualine_z = { "location" },
  },
}
