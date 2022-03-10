require "impatient"

require "fk.options"
require "fk.keymapings"
require "fk.disabled"
require "fk.globals"
require "fk.autocmd"

vim.defer_fn(function()
  require "fk.plugin"
end, 0)

require("tokyonight").colorscheme()
