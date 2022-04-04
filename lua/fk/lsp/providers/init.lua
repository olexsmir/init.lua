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
    return vim.tbl_extend("force", opts, require "fk.lsp.providers.pyright")
  end

  if server.name == "gopls" then
    return vim.tbl_extend("force", opts, require "fk.lsp.providers.gopls")
  end

  if server.name == "yamlls" then
    return vim.tbl_extend("force", opts, require "fk.lsp.providers.yamlls")
  end

  return opts
end
