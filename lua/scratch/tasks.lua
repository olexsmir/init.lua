local config = {
  label = "done:%Y%m%d-%H%M",
  archive_header = "# Archive",
  tasks_file = vim.fn.stdpath "config" .. "/tasks.json",
}

-- TODO: multi line tasks support
-- TODO: add support for nested tasks(one level max)
--    completing a nested task will tick it, not archive
--    once the parent task get archived, only then it's "children" gets archived
-- TODO: show progress of task with nested tasks(visual text, with, e.g 5/9)

---@return string[]
local function get_tasks_files()
  local f = io.open(config.tasks_file, "r")
  if not f then
    error("cannot read " .. config.tasks_file)
  end
  return vim.json.decode(f:read "*a")["files"]
end

local function get_done_label()
  return os.date(config.label) --[[@as string]]
end

---@param str string
local function is_task(str)
  return str:match "^%s*%- %[[x ]%]" ~= nil
end

---@param str string
local function is_task_labled(str)
  return str:match "^%s*%- %[[x ]%] `%" ~= nil
end

---@param str string
local function has_next_tag(str)
  return str:match "%#next" ~= nil
end

---@param str string
local function check_task_status(str)
  return str:match "^(%s*%- )%[x%]" ~= nil
end

---@param str string
local function remove_task_prefix(str)
  local res = str:gsub("^%- %[ %] ", "")
  return res
end

---@param str string
local function remove_next_tag(str)
  local res = str:gsub(" %#next", "")
  return res
end

-- converts a like with markdown task to completed task, and removes `#next` in it, if there's one
---@param str string
local function to_complete_task(str)
  local label = get_done_label()

  local task_prefix = str:match "^(%s*%- %[[x ]%])"
  if not task_prefix then
    return nil
  end

  str = task_prefix .. " `" .. label .. "`" .. str:sub(#task_prefix + 1)
  str = str:gsub("^(%s*%- )%[%s*%]", "%1[x]")
  str = remove_next_tag(str)
  str = str:gsub("%s+$", "")
  return str
end

---@param lines string[]
---@return number? - Line of the heading, nil if not found
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
function tasks.agenda()
  -- parse all `task_files` for `#next` tag
  ---@type table<string, {text: string, line: number}[]>
  local agenda_tasks = {}
  for _, fname in ipairs(get_tasks_files()) do
    local lines = vim.fn.readfile(fname)
    for i, line in ipairs(lines) do
      if is_task(line) and has_next_tag(line) then
        agenda_tasks[fname] = agenda_tasks[fname] or {}
        table.insert(agenda_tasks[fname], {
          text = line,
          line = i,
        })
      end
    end
  end

  -- build the output
  local output = {}
  for fname, ftasks in pairs(agenda_tasks) do
    for _, ftask in pairs(ftasks) do
      local task = remove_next_tag(ftask.text)
      task = remove_task_prefix(task)

      table.insert(output, {
        lnum = ftask.line,
        filename = fname,
        text = task,
      }--[[ @as vim.quickfix.entry ]])
    end
  end

  vim.fn.setqflist(output, "r")
  vim.cmd.copen()
end

function tasks.complete()
  local bufnr = vim.api.nvim_get_current_buf()
  local task_idx = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local task = lines[task_idx]

  if not is_task(task) then
    vim.notify("Not a task", vim.log.levels.WARN)
    return
  end

  if check_task_status(task) and is_task_labled(task) then
    vim.notify("Task already completed", vim.log.levels.ERROR)
    return
  end

  local archived_heading = find_archive_heading(lines)
  if archived_heading == nil then
    table.insert(lines, "")
    table.insert(lines, config.archive_header)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

    archived_heading = #lines
  end

  local completed_task = to_complete_task(task)
  table.remove(lines, task_idx)
  table.insert(lines, archived_heading, completed_task)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  vim.cmd.update()
end

return tasks
