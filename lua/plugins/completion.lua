return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
  },
  version = "1.*",
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      -- prob should remove but i just got too used to accepting snippets this way
      ["<C-l>"] = { "snippet_forward", "accept", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
      },
    },
    sources = {
      default = { "copilot", "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        lua = { inherit_defaults = true, "lazydev" },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    fuzzy = { -- :h blink-cmp-config-fuzzy
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
