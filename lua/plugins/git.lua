---@type LazySpec
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    keys = function()
      local function wrap(fn)
        return function()
          return require("gitsigns")[fn]()
        end
      end

      return {
        { "]g", wrap "next_hunk" },
        { "[g", wrap "prev_hunk" },
        { "<leader>gs", wrap "stage_hunk" },
        { "<leader>gS", wrap "undo_stage_hunk" },
        { "<leader>gr", wrap "reset_hunk" },
        { "<leader>gh", wrap "preview_hunk" },
        { "<leader>gb", wrap "blame" },
      }
    end,
    ---@type Gitsigns.Config
    ---@diagnostic disable: missing-fields
    opts = {
      max_file_length = 1000,
      current_line_blame = true,
      numhl = true,
      signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
        untracked = { text = "" },
      },
      current_line_blame_opts = {
        virt_text_pos = "eol",
        delay = 300,
      },
    },
  },

  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    keys = { { "<leader>gg", vim.cmd.Neogit } },
    ---@module "neogit"
    ---@type NeogitConfig
    dependencies = { "sindrets/diffview.nvim" },
    opts = {
      kind = "vsplit",
      console_timeout = 4000,
      auto_close_console = false,
      disable_builtin_notifications = true,
      disable_commit_confirmation = true,
      disable_context_highlighting = true,
      disable_hint = true,
      auto_show_console = false,
      graph_style = "kitty",
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      commit_editor = {
        kind = "split",
        staged_diff_split_kind = "split_above",
      },
      integrations = {
        telescope = true,
        diffview = true,
      },
      sections = {
        recent = {
          folded = false,
          hidden = false,
        },
      },
    },
  },

  {
    "nvim-cmp",
    ---@module "cmp"
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      ---@diagnostic disable-next-line:undefined-field
      table.insert(opts.custom_setups, function(cmp)
        cmp.setup.filetype({ "gitcommit", "NeogitCommitMessage" }, {
          sources = { { name = "buffer" }, { name = "luasnip" } },
        })
      end)
    end,
  },
}
