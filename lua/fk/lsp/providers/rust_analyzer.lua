return {
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsFromCheck = true },
      procMacro = { enable = true },
      completion = {
        autoimport = { enable = true },
        autoself = { enable = true },
      },
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
    },
  },
}
