local enabled = true

---@type LazySpec
return {
  enabled = enabled,
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
        ["."] = false,
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "copilot.lua" },
    enabled = enabled,
    cmd = { "CopilotChat" },
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
  {
    "nvim-cmp",
    cond = enabled,
    dependencies = {
      { "zbirenbaum/copilot-cmp", config = true },
      "copilot.lua",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 2,
        max_item_count = 3,
      })
    end,
  },
}
