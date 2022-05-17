require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.journal"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
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
