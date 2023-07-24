---@diagnostic disable: undefined-global
-- selene: allow(undefined_variable)
return {
  s(
    "M",
    fmt(
      [[local <> = {}

<>

return <>]],
      {
        i(1, "M"),
        i(0),
        rep(1),
      },
      { delimiters = "<>" }
    )
  ),
}
