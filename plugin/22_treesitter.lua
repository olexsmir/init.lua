Config.onpack("nvim-treesitter", "update", function()
  vim.cmd.TSUpdate()
end)

Config.add { src = "nvim-treesitter/nvim-treesitter", version = "main" }
Config.add "RRethy/nvim-treesitter-endwise"

Config.later(function()
  Config.add "nvim-treesitter/nvim-treesitter-context"
  require("treesitter-context").setup()
end)

Config.audocmd("FileType", {
  callback = function()
    -- TODO: auto install parsers ??
    pcall(vim.treesitter.start)
  end,
})
