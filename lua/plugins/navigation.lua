require("core.utils").aucmd("User", "OilActionsPost", {
  callback = function(ev)
    if ev and ev.data and ev.data.actions and ev.data.actions.type == "move" then
      Snacks.rename.on_rename_file(ev.data.actions.src_url, ev.data.actions.dest_url)
    end
  end,
})

---@type LazySpec
return {
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
          return ({
            [".."] = {}, -- annoying as hell
            [".git"] = {},
            [".jj"] = {},
            [".docker"] = {},
            ["build"] = {},
            ["dist"] = {},
            ["node_modules"] = {},
            ["elm-stuff"] = {},
            ["target"] = {},
          })[name] ~= nil
        end,
        is_hidden_file = function(name, _)
          return ({
            ["vendor"] = {},
            [".vscode"] = {},
            [".bin"] = {},
            ["tmp"] = {},
          })[name] ~= nil or vim.startswith(name, ".")
        end,
      },
    },
  },
}
