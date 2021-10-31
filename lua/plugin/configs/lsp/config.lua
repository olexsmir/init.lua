local M = {}

function M.setup()
  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, "n", ...)
    end

    local opts = { noremap = true, silent = true }
    buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("<leader>la", "<cmd>Telescope lsp_code_actions<CR>", opts)
    buf_set_keymap("<leader>ld", "<cmd>TroubleToggle<cr>", opts)
    buf_set_keymap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap("<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  end

  require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = { on_attach = on_attach }

    local ok, user_opts = pcall(require, "plugin.configs.lsp.providers." .. server.name)
    if ok then
      opts = vim.tbl_deep_extend("force", opts, user_opts)
    end

    server:setup(opts)
    require("lspconfig")["null-ls"].setup {}

    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
