Config.later(function()
  Config.add {
    src = "saghen/blink.cmp",
    version = vim.version.range "1.x",
  }

  vim.lsp.config("*", {
    flags = { debounce_text_changes = 150 },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })

  require("blink.cmp").setup {
    keymap = {
      preset = "enter",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-l>"] = { "snippet_forward", "accept", "fallback" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        ledger = { inherit_defaults = true, "ledger" },
        markdown = { inherit_defaults = true, "notes" },
      },
      providers = {
        ledger = { name = "ledger", module = "s.ledger" },
        notes = { name = "notes", module = "s.notes" },
      },
    },
  }
end)
