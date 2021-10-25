return {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        maxPreload = 100000,
        preloadFileSize = 10000,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
    },
  },
}
