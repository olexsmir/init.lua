return {
  denols = {},
  vimls = {},
  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        linksInHover = false,
        staticcheck = true,
        memoryMode = "Normal",
        analyses = {
          unusedparams = true,
          unreachable = true,
        },
      },
    },
  },
  pyright = {
    python = {
      disableOrganizeImports = true,
      autoSearchPaths = true,
      analysis = { useLibraryCodeForTypes = false },
    },
  },
}
