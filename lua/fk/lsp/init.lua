local diagnostic = require "fk.lsp.diagnostic"
local on_attach = require "fk.lsp.attach"
local M = {}

function M.setup()
  vim.diagnostic.config(diagnostic)
  for _, sign in ipairs(diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  require "fk.lsp.null"
  require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = { debounce_text_changes = 150 },
    }
    local ok, server_opts = pcall(require, "fk.lsp.providers." .. server.name)
    if ok then
      opts = vim.tbl_deep_extend("force", opts, server_opts or {})
    end

    if server.name == "sumneko_lua" then
      opts = vim.tbl_deep_extend("force", opts, require("lua-dev").setup {})
    end

    if server.name == "rust_analyzer" then
      opts = vim.tbl_deep_extend("force", server:get_default_options(), opts)
      require "fk.plugin.rust-tools"(opts)
      server:attach_buffers()
      vim.cmd [[ do User LspAttachBuffers ]]
      return
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
