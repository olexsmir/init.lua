local enabled = true

---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    enabled = enabled,
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = {
        enabled = false,
        auto_refresh = true,
        keymap = { refresh = "<C-r>" },
        layout = {
          position = "right",
          ratio = 0.3,
        },
      },
      filetypes = {
        yaml = true,
        TelescopePrompt = false,
        org = false,
        ledger = false,
        todotxt = false,
        ["."] = false,
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "copilot.lua" },
    enabled = enabled,
    -- stylua: ignore
    cmd = { "CopilotChat", "CopilotChatFix", "CopilotChatTests", "CopilotChatExplain", "CopilotChatDocs"},
    build = "make tiktoken",
    keys = {
      { "<leader>C", ":CopilotChat ", mode = { "n", "v" } },
    },
    ---@module "CopilotChat"
    ---@type CopilotChat.config
    opts = {
      auto_insert_mode = true,
      mappings = {
        ---@diagnostic disable-next-line: missing-fields
        reset = {
          insert = "<C-r>",
          normal = "<C-r>",
        },
        ---@diagnostic disable-next-line: missing-fields
        submit_prompt = {
          insert = "<C-CR>",
        },
        ---@diagnostic disable-next-line: missing-fields
        show_help = { normal = "?" },
      },
    },
  },
}
