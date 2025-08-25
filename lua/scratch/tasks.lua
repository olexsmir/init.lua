---@param name string
---@return string
local function task_file(name)
  return vim.fs.joinpath(vim.fn.expand "~/org/notes", name .. ".md")
end

local config = {
  label = "done:%Y%m%d-%H%M",
  archive_header = "# Archive",
  task_files = {
    task_file "TODO",
    task_file "Onasty",
    task_file "GBAC",
    task_file "Projects/gopher.nvim",
  },
}

-- TODO: add support for multiple line tasks
-- TODO: add "review" mode, show list of tasks that was done during this/previous week
-- TODO: undoing tasks, if task is marked as done, and has `done` label, it should replace done with `undone`
-- TODO: show the progress of tasks(if task has subtasks, show in virtual text how many of them is done) sub tasks should be only archived with the parent task

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
local function has_next_tag(str)
  return str:match "%#next" ~= nil
end

---@param str string
---@return boolean
local function check_task_status(str)
  return str:match "^(%s*%- )%[x%]" ~= nil
end

---@param str string
---@return string
local function remove_task_prefix(str)
  local res = str:gsub("^%- %[ %] ", "")
  return res
end

---@param str string
---@return string
local function remove_next_tag(str)
  local res = str:gsub(" %#next", "")
  return res
end

---@param str string
---@return string
local function remove_file_extension(str)
  local res = (str:match "^(.-)%.%w+$" or str)
  return res
end

-- converts a like with markdown task to completed task, and removes `#next` in it, if there's one
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
  --  FIXME: that's probably should be cached

  ---@type table<string, {text: string, line: number}[]>
  local agenda_tasks = {}
  for _, fname in ipairs(config.task_files) do
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
      local task = remove_file_extension(ftask.text)
      task = remove_next_tag(task)
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
