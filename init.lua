require "impatient"
require "fk.options"
require "fk.disabled"
require "fk.globals"
require "fk.autocmd"

vim.defer_fn(function()
  require "fk.plugin"
end, 0)

require "fk.keymapings"
require "fk.theme"
