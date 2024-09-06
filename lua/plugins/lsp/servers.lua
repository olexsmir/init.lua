return {
  clangd = {},
  ts_ls = {},
  eslint = {},
  html = {},
  emmet_language_server = {},
  htmx = {},
  templ = {},
  gleam = {},
  golangci_lint_ls = {
    init_options = {
      command = {
        "golangci-lint",
        "run",
        "--fast",
        "--out-format",
        "json",
        "--issues-exit-code=1",
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        linksInHover = false,
        staticcheck = true,
        gofumpt = true,
        analyses = {
          unusedparams = true,
          unreachable = true,
          unusedwrite = true,
          useany = true,
          shadow = true,
          nilness = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = false,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        codelenses = {
          generate = true,
          gc_details = false,
          test = true,
          tidy = true,
          run_govulncheck = true,
          upgrade_dependency = true,
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
        schemaStore = { enable = false },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  },
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
}
