local map = require("core.utils").smap
return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = { { "<leader>e", map("oil", "open") } },
  opts = {
    columns = { "icon" },
    use_default_keymaps = false,
    delete_to_trash = true,
    keymaps = {
      ["?"] = "actions.show_help",
      ["."] = "actions.toggle_hidden",

      ["<CR>"] = "actions.select",
      ["<tab>"] = "actions.select",

      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<A-p>"] = "actions.preview",
      ["<C-r>"] = "actions.refresh",
      ["<C-c>"] = "actions.close",

      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      [","] = "actions.parent",
      ["<"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        if
          ({
            [".git"] = {},
            [".vscode"] = {},
            ["dist"] = {},
            ["node_modules"] = {},
            ["__pycache__"] = {},
            ["vendor"] = {},
            ["target"] = {},
          })[name]
        then
          return true
        end
        return false
      end,
    },
  },
}
