local config = {
  label = "done:%Y%m%d-%H%M",
  archive_header = "# Archive",
  tasks_file = vim.fn.stdpath "config" .. "/tasks.json",
}

local ns = vim.api.nvim_create_namespace "scratch.tasks"

---@return string[]
local function get_tasks_files()
  local f = io.open(config.tasks_file, "r")
  if not f then
    error("cannot read " .. config.tasks_file)
  end
  return vim.json.decode(f:read "*a")["files"] or error "'files' is not found"
end

local function display_filename(str)
  local res = vim.fs.basename(str)
  res = res:gsub("%.%w+$", "")
  return res
end

---@param str string
local function is_task(str)
  return str:match "^%s*%- %[[x ]%]" ~= nil
end

---@param str string
local function is_task_labled(str)
  return str:match "^%s*%- %[[x ]%] `" ~= nil
end

---@param str string
local function has_next_tag(str)
  return str:match "%#n[ext]*" ~= nil
end

---@param str string
local function is_task_complete(str)
  return str:match "^(%s*%- )%[x%]" ~= nil
end

---@param str string
local function remove_task_link(str)
  local res = str:gsub("%[%[(.-)%]%]", "[%1]")
  return res
end

---@param str string
local function remove_next_tag(str)
  local res = str:gsub(" %#n[ext]*", "")
  return res
end

---@param str string
local function to_complete_task(str)
  local task_prefix = str:match "^(%s*%- %[[x ]%])"
  if not task_prefix then
    return nil
  end

  local label = os.date(config.label) --[[@as string]]
  str = task_prefix .. " `" .. label .. "`" .. str:sub(#task_prefix + 1)
  str = str:gsub("^(%s*%- )%[%s*%]", "%1[x]") -- mark task as complete
  str = remove_task_link(str)
  str = remove_next_tag(str)
  str = str:gsub("%s+$", "") -- white space in the end
  return str
end

---@param lines string[]
---@return number? - Line of the heading, nil if not found
local function find_archive_heading(lines)
  return vim.iter(ipairs(lines)):find(function(lnum, line)
    return line:match("^%s*" .. config.archive_header) ~= nil and lnum
  end)
end

local tasks = {}
function tasks.agenda()
  local qf_items = vim
    .iter(get_tasks_files())
    :map(function(fname)
      return vim
        .iter(ipairs(vim.fn.readfile(fname)))
        :filter(function(_, line)
          return is_task(line) and has_next_tag(line)
        end)
        :map(function(lnum, line)
          local task = remove_next_tag(line)
          task = remove_task_link(task)
          task = task:gsub("^%- %[ %] ", "") -- remove task prefix
          task = task:gsub("`", "")

          return {
            lnum = lnum,
            filename = fname,
            text = task,
            user_data = { filename = fname },
          } --[[@as vim.quickfix.entry]]
        end)
        :totable()
    end)
    :flatten()
    :totable()

  vim.fn.setqflist({}, "r", {
    nr = "$",
    title = "scratch.tasks",
    items = qf_items,
    quickfixtextfunc = function(info)
      local items = vim.fn.getqflist({ id = info.id, items = 1 }).items
      local lines, highlights = {}, {}
      for item = info.start_idx, info.end_idx do
        local entry = items[item]
        local fname = display_filename(entry.user_data.filename)
        local fname_paded = fname .. string.rep(" ", 7 - #fname) .. " "

        table.insert(lines, fname_paded .. entry.text)
        table.insert(highlights, { fname_len = #fname_paded })
      end

      vim.schedule(function()
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
        for i, hl in ipairs(highlights) do
          local line = info.start_idx + i - 2
          vim.hl.range(0, ns, "qfFileName", { line, 0 }, { line, hl.fname_len })
          vim.hl.range(0, ns, "Bold", { line, hl.fname_len }, { line, -1 })
        end
      end)

      return lines
    end,
  })

  vim.cmd.copen()
end

function tasks.complete()
  local bufnr = vim.api.nvim_get_current_buf()
  local task_idx = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local task = lines[task_idx]

  if not is_task(task) then
    vim.notify("Not a task", vim.log.levels.ERROR)
    return
  end

  if is_task_complete(task) and is_task_labled(task) then
    vim.notify("Task already completed", vim.log.levels.ERROR)
    return
  end

  local archived_heading = find_archive_heading(lines)
  if archived_heading == nil then
    table.insert(lines, "")
    table.insert(lines, config.archive_header)
    archived_heading = #lines
  end

  local completed_task = to_complete_task(task)
  table.remove(lines, task_idx)
  table.insert(lines, archived_heading, completed_task)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  vim.cmd.update()
end

function tasks.clear_archive()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local archived_heading = find_archive_heading(lines)
  if not archived_heading then
    vim.notify("Looks like there's no archive of tasks", vim.log.levels.ERROR)
  end

  -- minus 2 because = 1(the archive heading) + 1(empty line before it)
  lines = vim.list_slice(lines, 1, archived_heading - 2)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  vim.cmd.update()
end

return tasks
