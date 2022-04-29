---@param server Server
---@param opts table
---@return table
return function(server, opts)
  if server.name == "sumneko_lua" then
    return vim.tbl_extend(
      "force",
      opts,
      require("lua-dev").setup { lspconfig = server:get_default_options() }
    )
  end

  if server.name == "pyright" then
    return vim.tbl_extend("force", opts, {
      python = {
        disableOrganizeImports = true,
        autoSearchPaths = true,
        analysis = { useLibraryCodeForTypes = false },
      },
    })
  end

  if server.name == "gopls" then
    return vim.tbl_extend("force", opts, {
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
    })
  end

  if server.name == "yamlls" then
    return vim.tbl_extend("force", opts, {
      settings = {
        yaml = {
          schemaStore = {
            enable = true,
            url = "https://www.schemastore.org/api/json/catalog.json",
          },
        },
      },
    })
  end

  return opts
end
