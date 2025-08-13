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
-- TODO: undoing tasks, if task is marked as done, and has `done` label, it should replace done with `undone`
-- TODO: sort tasks under `# Tasks`, and move tasks with `#next` tag, on top
-- TODO: show the progress of tasks(if task has subtasks, show in virtual text how many of them is done)
--       sub tasks should be only archived with the parent task

---@param fpath string
---@return string
local function file_name_from_path(fpath)
  return fpath:match "^.+/(.+)$" or fpath
end

---@param short_name string
---@return string?
local function full_file_path_from_short_name(short_name)
  for _, fname in ipairs(config.task_files) do
    if file_name_from_path(fname) == short_name .. ".md" then
      return fname
    end
  end
  return nil
end

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

---@param fname string
---@param line number
---@return string
local function display_file(fname, line)
  local str = "" .. (fname:match "^(.-)%.%w+$" or fname) .. ":" .. line
  return (str .. string.rep(" ", 14 - #str))
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
  str = str:gsub("%#next", "")
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

  ---@type table<string, {task: string, line: number}[]>
  local agenda_tasks = {}
  for _, fname in ipairs(config.task_files) do
    local lines = vim.fn.readfile(fname)
    for i, line in ipairs(lines) do
      if is_task(line) and has_next_tag(line) then
        local short_name = file_name_from_path(fname)
        agenda_tasks[short_name] = agenda_tasks[short_name] or {}
        table.insert(agenda_tasks[short_name], { task = line, line = i })
      end
    end
  end

  -- build the output
  local output = { "# Agenda" }
  for fname, ftasks in pairs(agenda_tasks) do
    for _, ftask in pairs(ftasks) do
      table.insert(
        output,
        display_file(fname, ftask.line) .. " " .. remove_task_prefix(ftask.task)
      )
    end
  end

  -- open the agenda view
  vim.cmd.new()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, "scratch.tasks:agenda")
  vim.api.nvim_set_option_value("filetype", "markdown", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
  vim.api.nvim_exec_autocmds("FileType", { buffer = buf }) -- loads the ftplugins
  vim.api.nvim_win_set_height(0, 10)
  vim.api.nvim_win_set_cursor(0, { 2, 0 })

  -- FIXME: this should be a separate function
  vim.keymap.set("n", "<CR>", function()
    local line = vim.api.nvim_get_current_line()
    local fname, lineno = line:match "^([^:]+):(%d+)"
    if fname == nil or lineno == nil then
      vim.notify(
        "No file name or line number found in the line",
        vim.log.levels.WARN
      )
      return
    end

    local fpath = full_file_path_from_short_name(fname)
    if fpath == nil then
      vim.notify("No file name found in the line", vim.log.levels.WARN)
      return
    end

    vim.cmd.edit(fpath)
    vim.api.nvim_win_set_cursor(0, { tonumber(lineno), 0 })
  end, { buffer = buf, desc = "Open file under cursor", silent = true })
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
