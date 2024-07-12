local notes = {}

local config = {
  file_extenson = ".md",
  data_path = ("%s/ol_notes/"):format(vim.fn.stdpath "data"),
  open_cmd = "70vs",
}

---@return string
---@private
function notes.get_project_path()
  return vim.uv.cwd() --[[@as string]]
end

---@param prj_path string
---@return string
---@private
function notes.get_note_path(prj_path)
  if vim.fn.isdirectory(config.data_path) == 0 then
    vim.fn.mkdir(config.data_path, "p")
  end

  local p = prj_path:gsub("/", "_")
  return config.data_path .. "/" .. p .. config.file_extenson
end

function notes.project()
  vim.cmd(
    config.open_cmd .. "! " .. notes.get_note_path(notes.get_project_path())
  )
end

function notes.global()
  vim.cmd(config.open_cmd .. "! " .. config.data_path .. "/notes.md")
end

return notes
