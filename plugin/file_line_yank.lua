local function hl_line(l1, l2)
  vim.api.nvim_buf_set_mark(0, "[", l1, 0, {})
  vim.api.nvim_buf_set_mark(0, "]", l2, 0, {})
  vim.hl.hl_op { event = { operator = "y", regtype = "V" } }
end

Config.map("n", "<leader>y", function()
  local file = vim.fn.expand("%:.")
  if file == "" then return "[No Name]" end
  local line = vim.fn.line(".")
  vim.fn.setreg("+", file .. ":" .. line)
  hl_line(line, line)
end)

Config.map("x", "<leader>y", function()
  local file = vim.fn.expand("%:.")
  if file == "" then return "[No Name]" end

  local l1, l2 = vim.fn.line("v"), vim.fn.line(".")
  if l1 > l2 then l1, l2 = l2, l1 end

  local loc = (l1 == l2) and (file .. ":" .. l1) or (file .. ":" .. l1 .. "-" .. l2)
  vim.fn.setreg("+", loc)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  hl_line(l1, l2)
end)
