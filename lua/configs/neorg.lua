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
          prog = "~/notes/programing",
          self = "~/notes/self",
        },
      },
    },
  },
}
