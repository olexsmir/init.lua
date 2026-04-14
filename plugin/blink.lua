Config.add { src = "saghen/blink.cmp", version = vim.version.range "1.x" }
Config.later(function()
  require("blink.cmp").setup {
    keymap = {
      preset = "enter",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-l>"] = { "snippet_forward", "accept", "fallback" },
    },
    completion = { documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
    } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = { hledger = { inherit_defaults = true, "hledger" } },
      providers = { ledger = { name = "hledger", module = "hledger" } },
    },
  }

  vim.lsp.config("*", {
    flags = { debounce_text_changes = 150 },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })
end)
