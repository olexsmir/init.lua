---@return vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
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
}
