return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local map = require("core.utils").map
    local ls = require "luasnip"
    local types = require "luasnip.util.types"
    local fmt = require("luasnip.extras.fmt").fmt
    local extras = require "luasnip.extras"

    ls.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      region_check_events = "CursorMoved,CursorHold,InsertEnter",
      delete_check_events = "InsertLeave",
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
      ext_opts = {
        [types.choiceNode] = {
          passive = {
            virt_text = { { "●", "Operator" } },
            hl_group = "LuaSnipChoiceNode",
          },
        },
        [types.insertNode] = {
          active = {
            virt_text = { { "●", "Type" } },
            hl_group = "LuaSnipInsertNode",
          },
        },
      },
    }

    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()

    map({ "s", "i" }, "<C-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end)
  end,
}
