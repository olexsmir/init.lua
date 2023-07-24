local lspconfig = require "lspconfig"
local html_ft = {
  "html",
  "typescriptreact",
  "javascriptreact",
  "css",
  "scss",
  "astro",
  "gotmpl",
}

return {
  denols = { root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc") },
  tsserver = { root_dir = lspconfig.util.root_pattern "package.json" },
  rust_analyzer = {},
  clojure_lsp = {},
  html = { filetypes = html_ft },
  emmet_language_server = { filetypes = html_ft },
  astro = {},
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
        diagnostics = { globals = { "vim", "it", "describe" } },
        workspace = { checkThirdParty = false },
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
