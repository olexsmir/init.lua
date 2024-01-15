local gotests = {}

function gotests.switch()
  local bufnr = vim.api.nvim_get_current_buf()
  local fname = vim.api.nvim_buf_get_name(bufnr)
  local fname_parts = vim.split(fname, "/")
  local test_fname = fname_parts[#fname_parts]
  if test_fname:find "_test.go" then
    test_fname = test_fname:gsub("_test.go", ".go")
  else
    test_fname = test_fname:gsub(".go", "_test.go")
  end

  table.remove(fname_parts, #fname_parts)
  local path = table.concat(fname_parts, "/") .. "/" .. test_fname

  vim.cmd("edit " .. path)
end

return gotests
