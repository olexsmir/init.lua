local map = require("core.utils").smap
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
    -- selene: allow(multiple_statements)
    -- stylua: ignore start
    keys = { 
      { "<leader>a", function() require"harpoon":list():append() end },
      { "<C-f>", function() require"harpoon".ui:toggle_quick_menu(require"harpoon":list()) end },
      { "<A-f>", function() require"harpoon":list():select(1) end },
      { "<A-d>", function() require"harpoon":list():select(2) end },
      { "<A-s>", function() require"harpoon":list():select(3) end },
      { "<A-a>", function() require"harpoon":list():select(4) end },
    },
    -- style: ignore end
    config = function()
      require"harpoon":setup { settings = {
        save_on_toggle = true,
        sync_on_close = true,
      } }
    end,
  },

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    keys = { { "<leader>e", map("oil", "open") } },
    opts = {
      columns = { "icon" },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      lsp_rename_autosave = true,
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

        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        [","] = "actions.parent",

        ["\\"] = "actions.cd",
        ["C-\\"] = "actions.tcd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          if
            ({
              [".git"] = {},
              [".bin"] = {},
              [".vscode"] = {},
              [".docker"] = {},
              ["dist"] = {},
              ["node_modules"] = {},
              ["__pycache__"] = {},
              ["vendor"] = {},
              ["target"] = {},
            })[name]
          then
            return true
          end
          return false
        end,
      },
    },
  },
}
