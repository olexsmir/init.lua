local function jdtls_on_attach(client, bufnr)
  require "lsp.attach"(client, bufnr)
  -- stylua: ignore start
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lI", "<cmd>lua require('jdtls').organize_imports()<CR>", { silent = true, noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Tc", "<cmd>lua require('jdtls').test_class()<CR>", { silent = true, noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Tn", "<cmd>lua require('jdtls').test_nearest_method()<CR>", { silent = true, noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>lev", "<cmd>lua require('jdtls').extract_variable(true)<CR>", { silent = true, noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>lem", "<cmd>lua require('jdtls').extract_method(true)<CR>", { silent = true, noremap = true })
  -- stylua: ignore end
end

require("jdtls").start_or_attach {
  on_attach = jdtls_on_attach,
  root_dir = require("jdtls.setup").find_root { ".git", "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" },
  flags = { allow_incremental_sync = true },
  capabilities = {
    workspace = { configuration = true },
    textDocument = { completion = { completionItem = { snippetSupport = true } } },
  },
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",

    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    "$HOME/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",

    "-configuration",
    "$HOME/.local/share/nvim/lsp_servers/jdtls/config_linux",
  },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      sources = { organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      } },
      codeGeneration = {
        toString = { template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}" },
        useBlocks = true,
      },
      configuration = {
        runtimes = { { name = "JavaSE-11", path = "$HOME/.sdkman/candidates/java/11.0.11-open" } },
      },
    },
  },
}

local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local actions = require "telescope.actions"
local pickers = require "telescope.pickers"
local action_state = require "telescope.actions.state"

require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {
    winblend = 15,
    layout_config = {
      prompt_position = "top",
      width = 80,
      height = 12,
    },
  }
  pickers.new(opts, {
    prompt_title = prompt,
    finder = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry(prompt_bufnr)

        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end

vim.cmd "command! -buffer JdtCompile lua require('jdtls').compile()"
vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
