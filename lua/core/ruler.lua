vim.o.laststatus = 0
vim.o.ruler = true

---@param itms table<string>
local function join(itms)
  return vim
    .iter(itms)
    :filter(function(e)
      return e ~= ""
    end)
    :join " "
end

local function diagnostics()
  local counts = vim.diagnostic.count(vim.api.nvim_get_current_buf())
  local errors = counts[vim.diagnostic.severity.ERROR] or 0
  local warns = counts[vim.diagnostic.severity.WARN] or 0
  local info = counts[vim.diagnostic.severity.INFO] or 0
  local hint = counts[vim.diagnostic.severity.HINT] or 0

  return join {
    (errors > 0 and "%#DiagnosticError#" .. "󰅚 " .. errors .. "%*" or ""),
    (warns > 0 and "%#DiagnosticWarn#" .. "󰀪 " .. warns .. "%*" or ""),
    (info > 0 and "%#DiagnosticInfo#" .. "󰋽 " .. info .. "%*" or ""),
    (hint > 0 and "%#DiagnosticHint#" .. "󰌶 " .. hint .. "%*" or ""),
  }
end

local function git_diff()
  local diff = vim.b.gitsigns_status_dict
  if diff == nil then
    return ""
  end

  -- stylua: ignore
  return join {
    (diff.added ~= nil and diff.added > 0) and ("%#GitSignsAdd#+" .. diff.added .. "%*") or "",
    (diff.changed ~= nil and diff.changed > 0) and ("%#GitSignsChange#~" .. diff.changed .. "%*") or "",
    (diff.removed ~= nil and diff.removed > 0) and ("%#GitSignsDelete#-" .. diff.removed .. "%*") or "",
  }
end

local function location()
  return "%#TabLineSel# %l:%c %*"
end

local function modified()
  return "%m"
end

vim.opt.rulerformat = "%27(%=%{%v:lua.require'core.ruler'()%}%)"
return function()
  return join { git_diff(), diagnostics(), modified(), location() }
end
