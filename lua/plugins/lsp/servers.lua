return {
  tsserver = {},
  html = {},
  emmet_language_server = {},
  dockerls = {},
  gopls = {
    settings = {
      gopls = {
        linksInHover = false,
        staticcheck = true,
        gofumpt = true,
        analyses = { unusedparams = true, unreachable = true },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          constantValues = true,
          functionTypeParameters = false,
          parameterNames = false,
          rangeVariableTypes = true,
        },
        codelenses = {
          generate = false,
          gc_details = false,
          test = false,
          tidy = true,
        },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        format = { enable = false },
        completion = { callSnippet = "Replace" },
        hint = {
          enable = true,
          arrayIndex = "Disable",
          await = true,
          paramName = "Disable",
          paramType = false,
          semicolon = "Disable",
          setType = true,
        },
      },
    },
  },
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
  jsonls = {
    settings = { json = { schemas = require("schemastore").json.schemas() } },
  },
}
