require("lualine").setup {
  options = {
    theme = "tokyonight",
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "TelescopePrompt", "NeogitStatus" },
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
