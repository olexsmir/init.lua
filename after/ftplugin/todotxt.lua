local map = require("core.utils").map

local function get_date()
  return os.date "%Y-%m-%d"
end

-- add
map("n", "<localleader>a", function()
  vim.cmd("put ='" .. get_date() .. " '")
  vim.api.nvim_feedkeys("A", "n", false)
  vim.cmd "normal! a"
end)

map("n", "<localleader>d", function()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  vim.api.nvim_buf_set_lines(
    0,
    row - 1,
    row,
    false,
    { "x " .. get_date() .. " " .. line }
  )
end)
