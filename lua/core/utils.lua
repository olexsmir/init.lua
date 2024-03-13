local is_qf_exists = false
return {
  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  ---@param buffer? number|boolean
  map = function(mode, from, to, buffer)
    vim.keymap.set(mode, from, to, {
      noremap = true,
      silent = true,
      buffer = buffer or false,
    })
  end,

  qf_toggle = function()
    is_qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      is_qf_exists = win["quickfix"] == 1
    end

    if is_qf_exists == true then
      return vim.cmd.cclose()
    end

    if not vim.tbl_isempty(vim.fn.getqflist()) then
      vim.cmd.copen()
    end
  end,

  ---@return boolean
  get_qf_status = function()
    return is_qf_exists
  end,
}
