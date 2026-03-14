vim.pack.add { "https://github.com/rafamadriz/friendly-snippets" }

Config.packchange("blink.cmp", { "update" }, function()
  -- TODO: cargo build --release
end)

Config.later(function()
  vim.pack.add {
    {
      src = "https://github.com/saghen/blink.cmp",
      version = vim.version.range "1.x",
    },
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
        lua = { inherit_defaults = true, "lazydev" },
        ledger = { inherit_defaults = true, "ledger" },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        ledger = {
          name = "ledger",
          module = "s.ledger",
        },
      },
    },
  }
end)
