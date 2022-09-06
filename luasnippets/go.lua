---@diagnostic disable: undefined-global
-- selene: allow(undefined_variable)
return {
  s("in", { t "interface{}" }),
  s({ trig = "err", name = "if err" }, {
    t "if err != nil",
    t { " {", "\t" },
    i(0),
    t { "", "}" },
  }),
  s({ trig = "type", name = "type def", decr = "define a type" }, {
    t "type ",
    i(1, "Name"),
    c(2, {
      t " struct",
      t " interface",
    }),
    t { " {", "\t" },
    i(0),
    t { "", "}" },
  }),
  s(":", {
    i(1, "name"),
    t " := ",
    i(2, "value"),
  }),
}
