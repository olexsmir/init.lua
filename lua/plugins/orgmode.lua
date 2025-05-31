local u = require "core.utils"
local orgdir = "~/org/"

---@param p string
---@param not_file? boolean
---@return string
local function orgpath(p, not_file)
  return vim.fs.joinpath(orgdir, p) .. (not not_file and ".org" or "")
end

---@param act string
---@param opts? {}
local function action(act, opts)
  return function()
    return require("orgmode").action(act, opts or {})
  end
end

-- remove ugly background for folded text
local group = u.augroup "orgmode"
local pattern = { "*.org", "*.org_archive" }
u.aucmd({ "BufEnter", "BufWinEnter" }, {
  command = "highlight Folded guibg=NONE",
  pattern = pattern,
  group = group,
})

u.aucmd({ "BufLeave", "BufWinLeave" }, {
  command = "highlight Folded guibg=#3b4261", -- the color from tokyonight
  pattern = pattern,
  group = group,
})

---@type LazySpec
return {
  "nvim-orgmode/orgmode",
  ft = "org",
  cmd = "Org",
  keys = {
    "<leader>o",
    { "<leader>oo", ("<cmd>e " .. orgpath "refile" .. "<CR>") },
    { "<leader>oc", action "capture.prompt" },
    { "<leader>oa", action "agenda.prompt" },
  },
  dependencies = {
    { "akinsho/org-bullets.nvim", config = true },
  },
  ---@module "orgmode"
  ---@type OrgConfigOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    org_default_notes_file = orgpath "refile",
    org_agenda_files = orgpath("**/*", true),
    -- stylua: ignore
    org_todo_keywords = { "TODO(t)", "INB", "DOING(p)" , "|", "DONE(d)", "KILL(k)",},
    org_hide_emphasis_markers = true,
    org_startup_indented = true,
    org_startup_folded = "content",
    org_ellipsis = "\t\t[···]",
    org_priority_highest = "A",
    org_priority_lowest = "D",
    org_priority_default = "D",
    mappings = {
      prefix = "<leader>o",
      agenda = {
        org_agenda_filter = "<leader>/",
      },
      org = {
        org_open_at_point = "<CR>",
        org_return = nil,
        org_export = nil,
      },
      global = {
        org_agenda = nil,
        org_capture = nil,
      },
    },
    org_capture_templates = {
      t = {
        description = "Task",
        template = "* TODO %?",
        target = orgpath "personal",
      },
      i = { description = "Inbox", template = "* %?" },
      w = {
        description = "New vocab",
        template = "* %?",
        headline = "new vocab",
      },
    },
    org_agenda_custom_commands = {
      p = {
        description = "Personal",
        types = {
          {
            type = "tags_todo",
            match = "-goals-prj",
            org_agenda_overriding_header = "Personal todos",
            org_agenda_files = { orgpath "todo", orgpath "personal" },
            org_agenda_sorting_strategy = { "priority-down", "todo-state-down" },
          },
        },
      },
      n = {
        description = "Next action",
        types = {
          {
            type = "tags_todo",
            match = "next",
            org_agenda_overriding_header = "Next action",
          },
        },
      },
    },
  },
}
