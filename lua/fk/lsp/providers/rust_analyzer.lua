return {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = { loadOutDirsFromCheck = true },
      checkOnSave = { command = "clippy" },
      procMacro = { enable = true },
    },
  },
}
