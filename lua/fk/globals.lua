-- selene: allow(global_usage)
function _G.mkdir()
  local dir = vim.fn.expand "%:p:h"
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end

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
