---@param m string
---@return unknown
-- stylua: ignore
local function sreq(m)
  local ok, r = pcall(require, m)
  if not ok then return nil end
  return r
end

local M = {}

---@type hidden.org
M.org = sreq "hidden.org"

return M
