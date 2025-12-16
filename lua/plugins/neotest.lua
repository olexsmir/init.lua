---@type LazySpec
return {
  "nvim-neotest/neotest",
  keys = function()
    local function wrap(first, second, args)
      args = args or nil
      return function()
        return require("neotest")[first][second](args)
      end
    end

    return {
      { "<leader>tn", wrap("run", "run") },
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
      },
      { "<leader>tS", wrap("run", "stop") },
      { "<leader>to", wrap("output", "open") },
      { "<leader>ts", wrap("summary", "toggle") },
      { "<leader>tw", wrap("watch", "toggle") },
      { "]t", wrap("jump", "next") },
      { "[t", wrap("jump", "prev") },
      { "]T", wrap("jump", "next", { status = "failed" }) },
      { "[T", wrap("jump", "prev", { status = "failed" }) },
    }
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
    { "fredrikaverpil/neotest-golang", version = "v1" },
    "nvim-treesitter",
  },
  config = function()
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

    ---@type neotest.Config
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
  end,
}
