local function on_attach(bufnr)
  local api = require "nvim-tree.api"
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, { buffer = bufnr })
  vim.keymap.set("n", "<CR>", api.node.open.edit, { buffer = bufnr })
  vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = bufnr })
  vim.keymap.set("n", "v", api.node.open.vertical, { buffer = bufnr })
  vim.keymap.set("n", "s", api.node.open.horizontal, { buffer = bufnr })
end

return {
  "kyazdani42/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  keys = {
    { "<leader>e", vim.cmd.NvimTreeToggle },
  },
  opts = {
    on_attach = on_attach,
    diagnostics = { enable = true },
    renderer = { group_empty = true },
    git = { enable = true },
    filters = {
      dotfiles = true,
      custom = {
        "^\\.git$",
        "^\\.bin$",
        "node_modules",
        "__pycache__",
        "vendor",
        "target",
      },
    },
    view = { side = "right" },
  },
}
