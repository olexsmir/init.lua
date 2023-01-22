local map = require("core.utils").expr

map("i", "<C-;>", function()
  return vim.fn["codeium#Accept"]()
end)

map("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end)

map("i", "<C-.>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end)

map("i", "<A-;>", function()
  return vim.fn["codeium#"](-1)
end)
