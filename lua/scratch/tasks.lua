local config = {
  label = "done:%Y%m%d-%H%M",
  archive_header = "# Archive",
}

-- TODO: if task has `#next` tag, remove it before moving to the archive
-- TODO: add support for multiple line tasks
-- TODO: show the progress of tasks(if task has subtasks, show in virtual text how many of them is done)
--       sub tasks should be only archived with the parent task

---@return string
local function get_done_label()
  return os.date(config.label) --[[@as string]]
end

---@param str string
---@return boolean
local function is_task(str)
  return str:match "^%s*%- %[[x ]%]" ~= nil
end

---@param str string
---@return boolean
local function check_task_status(str)
  return str:match "^(%s*%- )%[x%]" ~= nil
end

---@param str string
---@return string?
local function to_complete_task(str)
  local label = get_done_label()

  local task_prefix = str:match "^(%s*%- %[[x ]%])"
  if not task_prefix then
    return nil
  end

  str = task_prefix .. " `" .. label .. "`" .. str:sub(#task_prefix + 1)
  str = str:gsub("^(%s*%- )%[%s*%]", "%1[x]")

  return str
end

---@param lines string[]
---@return number?  Line of the heading, nil if not found
local function find_archive_heading(lines)
  local heading_line = nil
  for i, line in ipairs(lines) do
    if line:match("^%s*" .. config.archive_header) then
      heading_line = i
      break
    end
  end
  return heading_line
end

local tasks = {}

-- TODO: implement this
function tasks.list_undone()
  error "unimplemented"
end

-- TODO: implement this
function tasks.list_done()
  error "unimplemented"
end

function tasks.complete()
  vim.cmd.mkview() -- saves current folds/scroll

  local bufnr = vim.api.nvim_get_current_buf()
  local cur_pos = vim.api.nvim_win_get_cursor(0)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local task_index = cur_pos[1]

  -- if cursor is beyond last line, exit
  if task_index > #lines then
    vim.cmd.loadview()
    return
  end

  if not is_task(lines[task_index]) then
    vim.notify("Not a task", vim.log.levels.WARN)
    vim.cmd.loadview()
    return
  end

  if check_task_status(lines[task_index]) then
    vim.notify("Task already completed", vim.log.levels.ERROR)
    vim.cmd.loadview()
    return
  end

  local archived_heading = find_archive_heading(lines)
  if archived_heading == nil then
    table.insert(lines, "")
    table.insert(lines, config.archive_header)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

    archived_heading = #lines
  end

  local completed_task = to_complete_task(lines[task_index])

  table.remove(lines, task_index)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  table.insert(lines, archived_heading, completed_task)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  vim.cmd "silent update"
  vim.cmd.loadview()
end

return tasks
