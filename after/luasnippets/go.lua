---@diagnostic disable: undefined-global
-- selene: allow(undefined_variable)
return {
  s({ trig = "err", name = "if err" }, {
    t "if err != nil",
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
