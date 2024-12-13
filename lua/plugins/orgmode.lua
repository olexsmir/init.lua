local prefix = "<C-c>"

---@type LazySpec
return {
  "nvim-orgmode/orgmode",
  ft = { "org" },
  keys = { prefix },
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
    org_default_notes_file = "~/org/refile.org",
    org_agenda_files = "~/org/**/*",
    mappings = {
      prefix = prefix,
    },
  },
}
