---@type LazySpec
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
      -- stylua: ignore
      return {
        { "<leader>a", function() require("harpoon"):list():add() end },
        { "<C-f>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
        { "<A-f>", function() require("harpoon"):list():select(1) end },
        { "<A-d>", function() require("harpoon"):list():select(2) end },
        { "<A-s>", function() require("harpoon"):list():select(3) end },
        { "<A-a>", function() require("harpoon"):list():select(4) end },
      }
    end,
    ---@type HarpoonPartialConfig
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_close = true,
      },
    },
    config = function(_, opts)
      require("harpoon"):setup(opts)
    end,
  },

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    cmd = "Oil",
    keys = { { "<leader>e", vim.cmd.Oil } },
    ---@module "oil"
    ---@type oil.setupOpts
    opts = {
      columns = { "icon" },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      lsp_file_methods = { autosave_changes = true },
      use_default_keymaps = false,
      keymaps = {
        ["."] = "actions.toggle_hidden",
        ["<CR>"] = "actions.select",
        ["<tab>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.open_cwd",
        [";"] = "actions.parent",
        ["\\"] = "actions.cd",
      },
      view_options = {
        show_hidden = false,
        is_always_hidden = function(name, _)
          if
            ({
              [".."] = {}, -- annoying as hell
              [".git"] = {},
              [".docker"] = {},
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
              ["tmp"] = {},
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
