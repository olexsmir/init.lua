return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  keys = {
    {
      "<C-l>",
      function()
        local ls = require "luasnip"
        if ls.choice_active() then
          ls.change_choice(1)
        elseif ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      mode = { "s", "i" },
    },
  },
  config = function()
    local ls = require "luasnip"
    local types = require "luasnip.util.types"
    local fmt = require("luasnip.extras.fmt").fmt
    local extras = require "luasnip.extras"

    ls.config.set_config {
      snip_env = {
        fmt = fmt,
        rep = extras.rep,
        m = extras.match,
        l = extras.lamda,
        s = ls.snippet,
        t = ls.text_node,
        f = ls.function_node,
        c = ls.choice_node,
        d = ls.dynamic_node,
        i = ls.insert_node,
      },
      -- stylua: ignore
      ext_opts = {
        [types.choiceNode] = { passive = { virt_text = { { "●", "Operator" } }, hl_group = "LuaSnipChoiceNode", }, },
        [types.insertNode] = { active = { virt_text = { { "●", "Type" } }, hl_group = "LuaSnipInsertNode", }, },
      },
    }

    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
