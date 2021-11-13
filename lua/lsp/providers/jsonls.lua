return {
  settings = {
    schemaDownload = {
      enable = true
    },
    schemas = {
      { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
    },
  },
}

--[[
return {
  settings = {
    json = {
      schemas = {
        {
          description = "TypeScript compiler configuration file",
          url = "https://json.schemastore.org/tsconfig.json",
          fileMatch = { "tsconfig.json", "tsconfig.*.json" },
        },
        {
          description = "Lerna config",
          url = "https://json.schemastore.org/lerna.json",
          fileMatch = { "lerna.json" },
        },
        {
          description = "ESLint config",
          url = "https://json.schemastore.org/eslintrc.json",
          fileMatch = { ".eslintrc.json", ".eslintrc" },
        },
        {
          description = "Prettier config",
          url = "https://json.schemastore.org/prettierrc",
          fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
        },
        {
          description = "golangci-lint configuration file",
          fileMatch = { ".golangci.toml", ".golangci.json" },
          url = "https://json.schemastore.org/golangci-lint.json",
        },
        {
          description = "NPM configuration file",
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
      },
    },
  },
}]]
