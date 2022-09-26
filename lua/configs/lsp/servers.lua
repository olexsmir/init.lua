return {
  tsserver = {},
  vimls = {},
  -- stylua: ignore
  emmet_ls = { filetypes = { "html", "htmldjango", "typescriptreact", "javascriptreact", "css", "scss", "less", }, },
  clojure_lsp = {},
  dockerls = {},
  gopls = {
    settings = {
      gopls = {
        linksInHover = false,
        staticcheck = true,
        analyses = { unusedparams = true, unreachable = true },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        format = { enable = false },
        hint = {
          enable = true,
          arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
          await = true,
          paramName = "Disable", -- "All", "Literal", "Disable"
          paramType = false,
          semicolon = "Disable", -- "All", "SameLine", "Disable"
          setType = true,
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
    settings = {
      json = { schemas = require("schemastore").json.schemas() },
    },
  },
}
