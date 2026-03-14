Config.add "echasnovski/mini.nvim"

Config.map("n", "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
  MiniFiles.reveal_cwd()
end)
Config.map("n", "<leader>c", function()
  require("mini.bufremove").delete()
end)

require("mini.icons").setup {}
Config.later(function()
  require("mini.ai").setup {}
  require("mini.bufremove").setup { silent = true }
  require("mini.comment").setup {}
  require("mini.hipatterns").setup {}
  require("mini.pairs").setup {}
  require("mini.splitjoin").setup {}
  require("mini.test").setup {}
end)

Config.aucmd("User", "MiniFilesActionRename", function(ev)
  Snacks.rename.on_rename_file(ev.data.from, ev.data.to)
end)

require("mini.files").setup {
  content = {
    filter = function(f)
      return ({
        [".bin"] = {},
        [".docker"] = {},
        [".git"] = {},
        [".jj"] = {},
        ["build"] = {},
        ["dist"] = {},
        ["elm-stuff"] = {},
        ["node_modules"] = {},
        ["tags"] = {},
        ["target"] = {},
      })[f.name] == nil
    end,
  },
  mappings = {
    synchronize = "<cr>",
    go_in = "",
    go_in_plus = "l",
  },
}
