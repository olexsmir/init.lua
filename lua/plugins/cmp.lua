return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require "cmp"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local luasnip = require "luasnip"

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    cmp.setup.filetype({ "gitcommit", "NeogitCommitMessage" }, {
      sources = { { name = "buffer" }, { name = "luasnip" } },
    })

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {},
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = ({
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
          })[vim_item.kind]

          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            -- stylua: ignore
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            -- stylua: ignore
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end,
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp", max_item_count = 8 },
        { name = "buffer", max_item_count = 4 },
        { name = "luasnip", max_item_count = 3 },
        { name = "path", max_item_count = 2 },
      },
    }
  end,
}
