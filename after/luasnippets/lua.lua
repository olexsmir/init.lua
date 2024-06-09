---@diagnostic disable: undefined-global
-- selene: allow(undefined_variable)
return {
  ls.snippet(
    "M",
    fmt(
      [[local <> = {}

<>

return <>]],
      {
        ls.insert_node(1, "M"),
        ls.insert_node(0),
        e.rep(1),
      },
      { delimiters = "<>" }
    )
  ),
}
