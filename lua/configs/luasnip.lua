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

map({ "s", "i" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
