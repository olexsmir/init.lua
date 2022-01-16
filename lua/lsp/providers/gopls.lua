return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      staticcheck = true,
      memoryMode = "DegradeClosed",
      experimentalPostfixCompletions = true,
    },
  },
}
