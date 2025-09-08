---@return vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.mod", "go.work" },
  settings = {
    gopls = {
      linksInHover = false,
      staticcheck = true,
      gofumpt = true,
      analyses = {
        unusedparams = true,
        unreachable = true,
        unusedwrite = true,
        shadow = true,
        S1008 = true, -- simplify returning boolean expression
        SA5000 = true, -- assignment to nil map
        SA5007 = true, -- infinite recursion call
        ST1019 = true, -- importing the same package multiple times
        SA1000 = true, -- invalid regular expression
        SA1020 = true, -- using an invalid host:port pair with a net.Listen-related function
        SA1023 = true, -- modifying the buffer in an io.Writer implementation
        SA9001 = true, -- defers in range loops may not run when you expect them to
        ST1013 = true, -- should use constants for HTTP error codes, not magic numbers
        ST1000 = false, -- Incorrect or missing package comment
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
        test = false,
        tidy = true,
        run_govulncheck = true,
        upgrade_dependency = true,
      },
    },
  },
}
