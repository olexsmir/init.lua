return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", vim.cmd.UndotreeToggle } },
    init = function()
      vim.g.undotree_DiffAutoOpen = 0
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = function()
      local h = require "harpoon"

      -- stylua: ignore
      return {
        { "<leader>a", function() h:list():append() end },
        { "<C-f>", function() h.ui:toggle_quick_menu(h:list()) end },
        { "<A-f>", function() h:list():select(1) end },
        { "<A-d>", function() h:list():select(2) end },
        { "<A-s>", function() h:list():select(3) end },
        { "<A-a>", function() h:list():select(4) end },
      }
    end,
    config = function()
      require("harpoon"):setup {
        settings = {
          save_on_toggle = true,
          sync_on_close = true,
        },
      }
    end,
  },

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>e",
        function()
          require("oil").open()
        end,
      },
    },
    opts = {
      columns = { "icon" },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      lsp_file_methods = { autosave_changes = true },
      use_default_keymaps = false,
      keymaps = {
        ["?"] = "actions.show_help",
        ["."] = "actions.toggle_hidden",

        ["<CR>"] = "actions.select",
        ["<tab>"] = "actions.select",

        ["<C-v>"] = "actions.select_vsplit",
        ["<C-x>"] = "actions.select_split",
        ["<A-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["<C-c>"] = "actions.close",
        ["<C-[>"] = "actions.close",

        ["-"] = "actions.open_cwd",
        [";"] = "actions.parent",

        ["\\"] = "actions.cd",
        ["C-\\"] = "actions.tcd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
      },
      view_options = {
        show_hidden = false,
        is_always_hidden = function(name, _)
          if
            ({
              [".."] = {}, -- annoying as hell
              [".git"] = {},
              [".docker"] = {},
              ["tmp"] = {},
              ["build"] = {},
              ["dist"] = {},
              ["node_modules"] = {},
              ["__pycache__"] = {},
              ["target"] = {},
            })[name]
          then
            return true
          end
          return false
        end,
        is_hidden_file = function(name, _)
          if
            ({
              ["vendor"] = {},
              [".vscode"] = {},
              [".bin"] = {},
            })[name]
          then
            return true
          end
          return vim.startswith(name, ".")
        end,
      },
    },
  },
}
