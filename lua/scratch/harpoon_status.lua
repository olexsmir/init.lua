local M = {}

---@param v number
---@return string
local function get_active_indicator(v)
  return string.format("]%d[", v)
end

---@return string
function M.status()
  local list = require("harpoon"):list()
  local rdir = list.config:get_root_dir()
  local cfpath = vim.api.nvim_buf_get_name(0)

  local status = {}
  for i = 1, list:length() do
    local value = list:get(i).value:gsub("^%./", "")
    if cfpath == rdir .. "/" .. value then
      table.insert(status, get_active_indicator(i))
    else
      table.insert(status, i)
    end
  end

  return table.concat(status, " "):reverse()
end

---@return boolean
function M.exists()
  return package.loaded["harpoon"] ~= nil
end

return M
