local M = {}

---@param v number
---@return string
local function get_active_indicator(v)
  return string.format("|%d|", v)
end

---@return string
function M.status()
  local h = require "harpoon"
  local list = h:list()
  local rdir = list.config:get_root_dir()
  local cfpath = vim.api.nvim_buf_get_name(0)
  local len = list:length()

  local status = {}
  for i = 1, len do
    local value = list:get(i).value
    value = value:gsub("^%./", "")

    if cfpath == rdir .. "/" .. value then
      table.insert(status, get_active_indicator(i))
    else
      table.insert(status, i)
    end
  end

  return table.concat(status, " ")
end

---@return string
function M.lualine()
  local harpoon_loaded = package.loaded["harpoon"] ~= nil
  if not harpoon_loaded then
    return ""
  end
  return M.status():reverse()
end

function M.debug()
  package.loaded["scratch.harpoon_status"] = nil
  require "scratch.harpoon_status"
end

return M
