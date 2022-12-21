---@diagnostic disable: undefined-global
-- selene: allow(undefined_variable)
return {
  s({ trig = "td", name = "TODO" }, {
    d(1, function()
      local function with_cmt(cmt)
        return string.format(vim.bo.commentstring, " " .. cmt)
      end
      return s("", {
        c(1, {
          t(with_cmt "TODO: "),
          t(with_cmt "FIXME: "),
          t(with_cmt "BUG: "),
        }),
      })
    end),
    i(0),
  }),
}
