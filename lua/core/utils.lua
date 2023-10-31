local is_qf_exists = false
return {
  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  map = function(mode, from, to)
    vim.keymap.set(mode, from, to, { noremap = true, silent = true })
  end,

  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  expr = function(mode, from, to)
    vim.keymap.set(mode, from, to, { noremap = true, expr = true })
  end,

  ---@param module string
  ---@param method string
  ---@param args? string
  ---@return string
  smap = function(module, method, args)
    args = args or ""
    return string.format(
      "<cmd>lua require'%s'.%s(%s)<cr>",
      module,
      method,
      args
    )
  end,

  qf_toggle = function()
    is_qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win["quickfix"] == 1 then
        is_qf_exists = true
      end
    end
    if is_qf_exists == true then
      vim.cmd "cclose"
      return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
      vim.cmd "copen"
    end
  end,

  ---@return boolean
  get_qf_status = function()
    return is_qf_exists
  end,
}
