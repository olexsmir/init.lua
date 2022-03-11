return {
  settings = {
    gopls = {
      linksInHover = false,
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      staticcheck = true,
      memoryMode = "Normal",
    },
  },
}
