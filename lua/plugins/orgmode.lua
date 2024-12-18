local prefix = "<leader>;"
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
    { "<leader>;a", wrap "agenda.prompt" },
    { "<leader>;c", wrap "capture.prompt" },
    { "<leader>;o", ("<cmd>e %s/refile.org<cr>"):format(dir) },
  },
  dependencies = {
    { "akinsho/org-bullets.nvim", config = true },
    {
      "nvim-orgmode/telescope-orgmode.nvim",
      ft = { "org" },
      dependencies = { "telescope.nvim" },
      config = function()
        require("telescope").load_extension "orgmode"
      end,
    },
  },
  ---@module "orgmode"
  ---@type OrgDefaultConfig
  opts = {
    org_default_notes_file = dir .. "/refile.org",
    org_agenda_files = dir .. "/**/*",
    mappings = {
      prefix = prefix,
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
        target = "~/org/todolist.org",
      },
    },
  },
}
