local notes = {}

local config = {
  file_extenson = ".md",
  data_path = ("%s/ol_notes/"):format(vim.fn.stdpath "data"),
  open_cmd = "e",
}

local git = {}

---@param cmd table
function git.cmd(cmd)
  vim.system(
    { "git", "-C", config.data_path, unpack(cmd) },
    { timeout = 120 },
    function(o)
      if cmd[1] == "commit" and o.code ~= 0 then
        vim.print "couldnt commit"
      end
    end
  )
end

function git.init()
  if vim.fn.isdirectory(config.data_path .. "/.git") == 0 then
    git.cmd { "init" }
  end
end

function git.commit()
  git.init()
  git.cmd { "add", "--all" }
  git.cmd {
    "commit",
    "-m",
    os.date "%Y-%m-%d %H:%M:%S",
  }
end

---@param bufnr number
function git.aucmd(bufnr)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("ol_notes_commit", { clear = true }),
    buffer = bufnr,
    callback = function()
      git.commit()
    end,
  })
end

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
  vim.cmd[config.open_cmd] {
    args = { notes.get_note_path(notes.get_project_path()) },
    bang = true,
  }

  git.aucmd(vim.fn.bufnr())
end

function notes.global()
  vim.cmd[config.open_cmd] {
    args = { config.data_path .. "/notes.md" },
    bang = true,
  }

  git.aucmd(vim.fn.bufnr())
end

return notes
