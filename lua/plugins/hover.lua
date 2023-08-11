local map = require("core.utils").smap
return {
  "lewis6991/hover.nvim",
  keys = {
    { "K", map("hover", "hover") },
    { "gK", map("hover", "hover_select") },
  },
  opts = {
    init = function()
      require "hover.providers.lsp"
      require "hover.providers.gh"
      require "hover.providers.gh_user"
      -- require "hover.providers.jira"
      require "hover.providers.man"
      require "hover.providers.dictionary"
    end,
    preview_window = false,
    preview_opts = { border = require("plugins.lsp.diagnostic").border },
    title = false,
  },
}
