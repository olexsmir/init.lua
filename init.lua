require "core.options"
require "core.lazy"
require "core.keymaps"
require "core.autocmd"
require "core.lsp"

-- enable new experimental ui
pcall(function()
  require("vim._extui").enable { enable = true }
end)
