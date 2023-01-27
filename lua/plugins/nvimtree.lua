return {
  "kyazdani42/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  opts = {
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
    view = {
      side = "right",
      mappings = {
        list = {
          { key = { "l", "<CR>", "o" }, action = "edit" },
          { key = "h", action = "close_node" },
          { key = "v", action = "vsplit" },
          { key = "s", action = "split" },
        },
      },
    },
  },
}
