return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = { "CopilotChat.nvim" },
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          refresh = "<C-r>",
        },
        layout = {
          position = "right",
          ratio = 0.3,
        },
      },
      filetypes = {
        markdown = false,
        gitignore = false,
        TelescopePrompt = false,
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = { "CopilotChat" },
    keys = {
      { "<leader>C", ":CopilotChat ", mode = { "n", "v" } },
    },
    opts = {
      mappings = {
        reset = "<C-r>",
      },
    },
  },
}
