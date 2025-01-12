local dir = "~/org"
local function orgpath(path, not_a_file)
  not_a_file = not_a_file or false
  if not_a_file then
    return dir .. "/" .. path
  end
  return dir .. "/" .. path .. ".org"
end

local function wrap(action, opts)
  opts = opts or {}
  return function()
    return require("orgmode").action(action, opts)
  end
end

---@type LazySpec
return {
  "nvim-orgmode/orgmode",
  ft = "org",
  keys = {
    "<leader>o",
    { "<leader>oo", ("<cmd>e " .. orgpath "refile" .. "<CR>") },
    { "<leader>oc", wrap "capture.prompt" },
    { "<leader>oa", wrap "agenda.prompt" },
  },
  dependencies = {
    { "akinsho/org-bullets.nvim", config = true },
  },
  ---@module "orgmode"
  ---@type OrgDefaultConfig
  opts = {
    org_default_notes_file = orgpath "refile",
    org_agenda_files = orgpath("**/*", true),
    org_todo_keywords = { "TODO(t)", "|", "DONE(d)" },
    org_hide_emphasis_markers = true,
    org_startup_indented = true,
    org_startup_folded = "content", -- "showeverything"
    mappings = {
      prefix = "<leader>o",
      org = {
        org_open_at_point = "<CR>",
        org_return = false,
        org_export = false,
      },
      global = {
        org_agenda = false,
        org_capture = false,
      },
    },
    org_capture_templates = {
      t = {
        description = "Task",
        template = "* TODO %? :in:",
        target = orgpath "todo",
      },
      i = { description = "Inbox", template = "* %? :in:" },
      w = {
        description = "New vocab",
        template = "* %? :vocab:",
        headline = "new vocab",
      },
    },
  },
}
