require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
    ["core.norg.journal"] = { config = { workspace = "self" } },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = ",",
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          prog = "~/Notes/Programing",
          study = "~/Notes/Study",
          my = "~/Notes/My",
        },
      },
    },
  },
}
