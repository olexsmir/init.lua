local hints = require "lsp-inlayhints"

local group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    hints.on_attach(client, args.buf)
  end,
})

hints.setup {
  inlay_hints = {
    highlight = "Comment",
    parameter_hints = {
      show = false,
      prefix = "<- ",
      separator = ", ",
    },
    type_hints = {
      show = true,
      prefix = "",
      separator = ", ",
      remove_colon_end = false,
      remove_colon_start = false,
    },
  },
}
