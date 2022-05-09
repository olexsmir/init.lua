require "configs.lsp.diagnostic"()
require "configs.lsp.null-ls"
require("nvim-lsp-installer").setup {
  ensure_installed = { "sumneko_lua" },
}

local lspconfig = require "lspconfig"
local options = {
  on_attach = require "configs.lsp.attach",
  flags = { debounce_text_changes = 150 },
  capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

local servers = {
  rnix = {},
  denols = {},
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
  gopls = {
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
  },
  pyright = {
    python = {
      disableOrganizeImports = true,
      autoSearchPaths = true,
      analysis = { useLibraryCodeForTypes = false },
    },
  },
}

for name, conf in pairs(servers) do
  lspconfig[name].setup(vim.tbl_extend("force", options, conf))
end

lspconfig.sumneko_lua.setup(require("lua-dev").setup {
  lspconfig = options,
})
