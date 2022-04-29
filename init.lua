local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

require "core.options"
require "plugins"
require "core.keymaps"
require "core.autocmd"
