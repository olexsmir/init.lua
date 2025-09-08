---@return vim.lsp.Config
return {
  cmd = { "typescript-language-server", "--stdio" },
  init_options = { hostInfo = "neovim" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  handlers = {
    -- handle rename request for certain code actions like extracting functions / types
    ["_typescript.rename"] = function(_, result, ctx)
      local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      vim.lsp.util.show_document({
        uri = result.textDocument.uri,
        range = {
          start = result.position,
          ["end"] = result.position,
        },
      }, client.offset_encoding)
      vim.lsp.buf.rename()
      return vim.NIL
    end,
  },
}
