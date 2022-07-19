local ok, impatient = pcall(require, "impatient")
if ok and impatient ~= nil then
  impatient.enable_profile()
end

require "core.options"
require "plugins"
require "core.keymaps"
require "core.autocmd"
