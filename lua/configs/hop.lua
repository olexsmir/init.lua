local hop = require "hop"
local map = require("core.utils").map

hop.setup {}

map("n", "f", function()
  hop.hint_char1()
end)
map("n", "F", function()
  hop.hint_char2()
end)
map("n", "<localleader>f", function()
  hop.hint_lines_skip_whitespace()
end)
map("n", "<localleader>F", function()
  hop.hint_lines()
end)
