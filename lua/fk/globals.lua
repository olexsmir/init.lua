-- selene: allow(global_usage)
function _G.P(v)
  print(vim.inspect(v))
  return v
end

function _G.RELOAD(...)
  return require("plenary.reload").reload_module(...)
end

function _G.R(name)
  _G.RELOAD(name)
  return require(name)
end
