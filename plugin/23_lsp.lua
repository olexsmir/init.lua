vim.pack.add {
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/nvimtools/none-ls.nvim",
}

require("fidget").setup {
  progress = {
    display = {
      render_limit = 2,
      done_ttl = 2,
    },
  },
}

require("lazydev").setup {
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "mini.nvim", words = { "MiniAI", "MiniTest" } },
    { path = "snacks.nvim", words = { "Snacks" } },
  },
}

local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

null_ls.setup {
  sources = {
    formatting.pg_format,

    formatting.stylua,
    diagnostic.selene.with {
      condition = function(utils)
        return utils.root_has_file "selene.toml"
      end,
    },

    formatting.goimports,
    formatting.golines,
  },
}
