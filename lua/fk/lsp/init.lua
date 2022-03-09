local on_attach = require "fk.lsp.attach"
local diagnostic = require "fk.lsp.diagnostic"
local M = {}

function M.setup()
  -- Diagnostics
  vim.diagnostic.config(diagnostic)
  for _, sign in ipairs(diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  require("nvim-lsp-installer").on_server_ready(function(server)
    require "fk.lsp.null" -- null-ls setup
    local opts = {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    -- setup server config if it exists
    require("lua-dev").setup()
    local ok, server_opts = pcall(require, "fk.lsp.providers." .. server.name)
    if ok then
      opts = vim.tbl_deep_extend("force", opts, server_opts or {})
    end

    server:setup(opts)

    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
