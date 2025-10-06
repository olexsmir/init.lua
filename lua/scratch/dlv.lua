local dlv = {}
local cache = {
  tab_id = nil,
  signs = {},
}

vim.fn.sign_define("Breakpoint", { text = "b", texthl = "Error" })

local function kitty(args)
  local res = vim.system({ "kitty", "@", unpack(args) }, { text = true }):wait()
  if res.code ~= 0 then
    vim.notify("failed to kitty @ " .. vim.inspect(args), vim.log.levels.ERROR)
  end
  return res
end

local function get_dlv_tab_id()
  if cache.tab_id then
    return cache.tab_id
  end

  local res = kitty { "ls" }
  local out = vim.json.decode(res.stdout)

  for _, tab in ipairs(out) do
    for _, win in ipairs(tab.tabs or {}) do
      for _, w in ipairs(win.windows or {}) do
        if
          w.title:match "^dlv connect"
          or w.title:match "^dlv debug"
          or w.title:match "^dlv test"
        then
          cache.tab_id = w.id
          return w.id
        end
      end
    end
  end

  vim.notify("it seems like there's no dlv running", vim.log.levels.ERROR)
end

function dlv.bset()
  local line = vim.fn.line "."

  -- send breakpoint
  local tid = get_dlv_tab_id()
  local cmd = string.format("break %s:%d\n", vim.fn.expand "%:t", line)
  kitty { "send-text", "-m", "id:" .. tid, cmd }

  -- set sign
  local fullpath = vim.fn.expand "%:p"

  local sid = tonumber(string.format("%d%04d", vim.fn.bufnr(), line)) --[[ @as number]]
  vim.fn.sign_place(sid, "Breakpoints", "Breakpoint", fullpath, { lnum = line })
  table.insert(cache.signs, sid)
end

function dlv.clear()
  for _, sid in ipairs(cache.signs) do
    vim.fn.sign_unplace("Breakpoints", { id = sid })
  end

  cache.signs = {}
  cache.tab_id = nil

  vim.notify("Cleared all breakpoints.", vim.log.levels.INFO)
end

return dlv
