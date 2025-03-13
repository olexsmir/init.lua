local u = require "core.utils"
local h = require("hidden").org
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
  keys = {
    "<leader>o",
    { "<leader>oo", ("<cmd>e " .. orgpath "refile" .. "<CR>") },
    { "<leader>oc", action "capture.prompt" },
    { "<leader>oa", action "agenda.prompt" },
  },
  dependencies = {
    { "akinsho/org-bullets.nvim", config = true },
    {
      "chipsenkbeil/org-roam.nvim",
      version = false,
      keys = { "<leader>r" },
      ---@module "org-roam"
      ---@type org-roam.config.Data
      opts = {
        directory = orgpath("roam", true),
        org_files = { orgpath "refile", orgpath "personal" },
        bindings = {
          prefix = "<leader>r",
          find_node = "<prefix>s",
        },
        templates = {
          n = {
            description = "Note",
            template = "%?",
            target = "%<%Y%m%d%H%M%S>-%[slug].org",
          },
          w = {
            description = "Weekly",
            template = h.weekly_template,
            target = "%r/weekly/%<%Y %V>.org",
          },
          d = {
            description = "Daily",
            template = h.daily_template,
            target = "%r/daily/%<%Y-%m-%d>.org",
          },
        },
        ---@class org-roam.config.Extensions
        extensions = {
          dailies = {
            bindings = {
              goto_today = "<prefix>t",
            },
          },
        },
      },
    },
    {
      "nvim-cmp",
      ---@module "cmp"
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        table.insert(opts.sources, {
          name = "orgmode",
          group_index = 0,
        })
      end,
    },
  },
  ---@module "orgmode"
  ---@type OrgConfigOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    org_default_notes_file = orgpath "refile",
    org_agenda_files = orgpath("**/*", true),
    -- stylua: ignore
    org_todo_keywords = { "TODO(t)", "INB", "WAIT(w)", "DOING(p)" , "|", "DONE(d)", "KILL(k)",},
    org_hide_emphasis_markers = true,
    org_startup_indented = true,
    org_startup_folded = "content", -- "showeverything"
    org_ellipsis = "\t\t[···]",
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
        target = orgpath "todo",
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
            match = "-sp1-sp2-sp3-sp4-sp5",
            org_agenda_overriding_header = "Personal todos",
            org_agenda_files = { orgpath "todo", orgpath "personal" },
            org_agenda_sorting_strategy = { "todo-state-down", "category-down" },
          },
        },
      },
    },
  },
}
