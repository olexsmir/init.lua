local cmp = require "cmp"
local luasnip = require "luasnip"

require("luasnip.loaders.from_vscode").load {
  paths = {
    "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
  },
}

cmp.event:on(
  "confirm_done",
  require("nvim-autopairs.completion.cmp").on_confirm_done {
    map_char = { tex = "" },
  }
)

cmp.setup.filetype({ "gitcommit", "NeogitCommitMessage" }, {
  sources = {
    { name = "buffer" },
    { name = "emoji" },
    { name = "luasnip" },
  },
})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = ({
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "ﰮ",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "﬌",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "ﬦ",
        TypeParameter = "",
      })[vim_item.kind]

      return vim_item
    end,
  },
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes(
            "<Plug>luasnip-expand-or-jump",
            true,
            true,
            true
          ),
          ""
        )
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes(
            "<Plug>luasnip-jump-prev",
            true,
            true,
            true
          ),
          ""
        )
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lsp", max_item_count = 8 },
    { name = "buffer", max_item_count = 4 },
    { name = "luasnip", max_item_count = 3 },
    { name = "path", max_item_count = 2 },
  },
  experimental = { ghost_text = true },
}
