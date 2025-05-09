--- this is a place where i put all my hidden stuff,
--- like things that i just feel like private to me
--- of things that related to my work
--- also probably i in the future i might delete this file all together

local hidden = {}
local function wrap(mod)
  local ok, r = pcall(require, mod)
  if not ok then
    error(mod .. " not found")
  end
  return r
end

---@class hidden.org
---@field templates fun(merge: table): table
hidden.org = wrap "hidden.org"

return hidden
