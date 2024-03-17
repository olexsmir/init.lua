local h = require "harpoon"
local M = {}

local function get_active_indicator(v)
  return string.format("|%d|", v)
end

function M.status()
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

function M.lualine()
  if not package.loaded["harpoon"] ~= nil then
    return
  end
  return M.status():reverse()
end

function M.debug()
  package.loaded["scratch.harpoon_status"] = nil
  require "scratch.harpoon_status"
end

return M
