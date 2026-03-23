Config.onpack("nvim-treesitter", "update", function()
  vim.cmd.TSUpdate()
end)

Config.add { src = "nvim-treesitter/nvim-treesitter", version = "main" }
Config.later(function()
  Config.add "nvim-treesitter/nvim-treesitter-context"
  require("treesitter-context").setup {
    max_lines = 4,
  }
end)

Config.aucmd("FileType", "*", function(ev)
  -- TODO: auto install parsers ??
  if not ev.match or ev.match == "" or ev.match == "text" then vim.treesitter.stop() end
  pcall(vim.treesitter.start)
end)
