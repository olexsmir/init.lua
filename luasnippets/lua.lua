---@diagnostic disable: undefined-global
-- selene: allow(undefined_variable)
return {
  s("req", fmt('local {} = require "{}"', { i(1, "name"), i(2, "module") })),
}
