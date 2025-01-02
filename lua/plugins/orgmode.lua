local dir = "~/org"

local function wrap(fn)
  return function()
    require("orgmode").action(fn)
  end
end

---@type LazySpec
return {
  "nvim-orgmode/orgmode",
  ft = { "org" },
  keys = {
    "<leader>r",
    "<leader>o",
    { "<leader>oc", wrap "capture.prompt" },
    { "<leader>oa", wrap "agenda.prompt" },
    { "<leader>oo", ("<cmd>e %s/refile.org<cr>"):format(dir) },
  },
  dependencies = {
    { "akinsho/org-bullets.nvim", config = true, enabled = true },
    {
      "nvim-orgmode/telescope-orgmode.nvim",
      ft = { "org" },
      dependencies = { "telescope.nvim" },
      config = function()
        require("telescope").load_extension "orgmode"
      end,
    },
    {
      "chipsenkbeil/org-roam.nvim",
      dependencies = { "orgmode" },
      ---@module "org-roam"
      ---@type org-roam.config.Data
      opts = {
        directory = dir .. "/roam",
        org_files = { dir .. "/refile.org" },
        bindings = {
          prefix = "<leader>r",
        },
      },
    },
  },
  ---@module "orgmode"
  ---@type OrgDefaultConfig
  opts = {
    org_default_notes_file = dir .. "/refile.org",
    org_agenda_files = dir .. "/**/*",
    org_todo_keywords = { "TODO", "DOING", "|", "DONE" },
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
        template = "* TODO %?",
        target = dir .. "/todolist.org",
      },
      i = {
        description = "Inbox",
        template = "* %?",
        target = dir .. "/refile.org",
      },
    },
  },
}
