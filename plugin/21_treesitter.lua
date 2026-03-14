Config.packchange("nvim-treesitter", "update", function()
  vim.cmd.TSUpdate()
end)

vim.pack.add {
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
  "https://github.com/RRethy/nvim-treesitter-endwise",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
}

Config.later(function()
  require("treesitter-context").setup()
end)

Config.aucmd("FileType", {
  callback = function()
    -- TODO: auto install parsers ??
    pcall(vim.treesitter.start)
  end,
})
