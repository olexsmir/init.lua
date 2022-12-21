local hints = require "lsp-inlayhints"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if not args.data and not args.data.client_id then
      return
    end

    hints.on_attach(
      vim.lsp.get_client_by_id(args.data.client_id),
      args.buf,
      true
    )
  end,
})

hints.setup {
  inlay_hints = {
    highlight = "Comment",
    parameter_hints = { show = false },
  },
}
