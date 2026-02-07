local dlv = {}
local cache = {
  pane_id = nil,
  signs = {},
}

vim.fn.sign_define("Breakpoint", { text = "b", texthl = "Error" })

local function get_dlv_pane_id()
  if cache.pane_id then
    return cache.pane_id
  end

  local res = vim
    .system({
      "tmux",
      "list-panes",
      "-s",
      "-F",
      "#{pane_id}:#{pane_current_command}",
    }, { text = true })
    :wait()

  if res.code ~= 0 then
    vim.notify("Failed to list tmux panes", vim.log.levels.ERROR)
    return
  end

  for line in res.stdout:gmatch "[^\n]+" do
    local pane_id, command = line:match "([^:]+):(.*)"
    if command and command:match "^dlv" then
      cache.pane_id = pane_id
      return pane_id
    end
  end

  vim.notify("No dlv session found", vim.log.levels.ERROR)
end

function dlv.bset()
  local line = vim.fn.line "."

  -- send breakpoint
  local cmd = string.format("break %s:%d", vim.fn.expand "%:p", line) 
  vim.system { "tmux", "send-keys", "-t", get_dlv_pane_id(), cmd, "Enter" }

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
