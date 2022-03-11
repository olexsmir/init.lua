require("lualine").setup {
  options = {
    theme = "tokyonight",
    component_separators = { "", "" },
    section_separators = { "", "" },
    disabled_filetypes = { "NvimTree", "Telescope", "NeogitStatus" },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = { "filename" },
    lualine_b = { "branch" },
    lualine_c = { "location" },
    lualine_x = { "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename", "location" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
