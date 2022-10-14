require("illuminate").configure {
  providers = { "lsp", "treesitter" },
  filetypes_denylist = {
    "NvimTree",
    "packer",
    "neogitstatus",
    "Trouble",
    "TelescopePrompt",
  },
}
