local function wrap(first, second, args)
  return function()
    return require("neotest")[first][second](args or nil)
  end
end

Config.map("n", "<leader>tn", wrap("run", "run"))
Config.map("n", "<leader>tS", wrap("run", "stop"))
Config.map("n", "<leader>to", wrap("output", "open"))
Config.map("n", "<leader>ts", wrap("summary", "toggle"))
Config.map("n", "<leader>tw", wrap("watch", "toggle"))
Config.map("n", "]t", wrap("jump", "next"))
Config.map("n", "[t", wrap("jump", "prev"))
Config.map("n", "]T", wrap("jump", "next", { status = "failed" }))
Config.map("n", "[T", wrap("jump", "prev", { status = "failed" }))
Config.map("n", "<leader>tt", function()
  require("neotest").run.run(vim.fn.expand "%")
end)

Config.later(function()
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local r, _ = diagnostic.message
          :gsub("\n", " ")
          :gsub("\t", " ")
          :gsub("%s+", " ")
          :gsub("^%s+", "")
        return r
      end,
    },
  }, vim.api.nvim_create_namespace "neotest")

  Config.add "nvim-neotest/neotest"
  Config.add "nvim-neotest/nvim-nio"
  Config.add "fredrikaverpil/neotest-golang"

  ---@diagnostic disable-next-line: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-golang" {
        go_test_args = { "-count=1", "-timeout=60s" },
        testify_enabled = true,
      },
    },
    discovery = {
      enabled = true,
      concurrent = 0,
    },
    running = { concurrent = true },
    icons = {
      expanded = "",
      child_prefix = "",
      child_indent = "",
      final_child_prefix = "",
      non_collapsible = "",
      collapsed = "",
      passed = "",
      running = "",
      failed = "",
      unknown = "",
    },
    ---@diagnostic disable-next-line: missing-fields
    summary = {
      animated = false,
      ---@diagnostic disable-next-line: missing-fields
      mappings = {
        expand = { "l", "h", "<CR>" },
        stop = "s",
      },
    },
  }
end)
