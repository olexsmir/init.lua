require "core.options"
require "core.lazy"
require "core.keymaps"
require "core.autocmd"
require "core.ruler"
require "core.lsp"

if vim.fn.has "nvim-0.12" == 1 then
  require("vim._extui").enable { enable = true }
end
