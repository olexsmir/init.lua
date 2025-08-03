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
    ---@type CopilotChat.config.Config
    ---@diagnostic disable: missing-fields
    opts = {
      auto_insert_mode = true,
      mappings = {
        reset = {
          insert = "<C-r>",
          normal = "<C-r>",
        },
        submit_prompt = { insert = "<C-CR>" },
        show_help = { normal = "?" },
      },
      headers = {
        user = "👤 You: ",
        assistant = "🤖 Copilot: ",
        tool = "🔧 Tool: ",
      },
    },
  },
}
