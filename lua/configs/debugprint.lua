local dp = require "debugprint"
local u = require "core.utils"

dp.setup {}

u.expr("n", "<leader>P", function()
  return require("debugprint").debugprint { variable = true }
end)

u.map("n", "g?d", function()
  dp.deleteprints()
end)
