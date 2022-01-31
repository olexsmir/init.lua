local M = {}

function M.setup()
  local wk = require "which-key"

  wk.setup {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = false,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comments" },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
    ignore_missing = true,
    show_help = true,
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    window = {
      border = "none",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 0, 1, 1, 0 },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  local mappings = {
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    e = { "<cmd>NvimTreeToggle<cr>", "File explorer" },
    b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    w = { "<cmd>write!<cr>", "Save file" },
    q = { "<cmd>quit!<cr>", "Quit" },
    c = { "<cmd>bdelete<cr>", "Close buffer" },
    h = { "<cmd>nohlsearch<cr>", "No hl" },
    n = { "<cmd>vs | e! /tmp/note.md<cr>", "Note" },
    s = {
      name = "telescope",
      t = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      r = { "<cmd>Telescope oldfiles<cr>", "Find oldfile" },
      b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
      c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
      k = { "<cmd>Telescope keymaps<cr>", "Find keymap" },
    },
    g = {
      name = "git",
      g = { "<cmd>Neogit<cr>", "Neogit" },
      s = { "<cmd>lua require[[gitsigns]].stage_hunk()<cr>", "Stage hunk" },
      r = { "<cmd>lua require[[gitsigns]].reset_hunk()<cr>", "Reset hunk" },
      p = { "<cmd>lua require[[gitsigns]].preview_hunk()<cr>", "Preview hunk" },
      b = { "<cmd>lua require[[gitsigns]].blame_line(true)<cr>", "Blame line" },
      R = { "<cmd>lua require[[gitsigns]].reset_buffer()<cr>", "Reset buffer" },
      S = { "<cmd>lua require[[gitsigns]].stage_buffer()<cr>", "Stage buffer" },
    },
    p = {
      name = "packer",
      s = { "<cmd>PackerSync<cr>", "Sync" },
      c = { "<cmd>PackerClean<cr>", "Clean" },
    },
    t = {
      name = "test",
      t = { "<cmd>Ultest<cr>", "Run all" },
      s = { "<cmd>UltestStop<cr>", "Stop all" },
      c = { "<cmd>UltestClear<cr>", "Clean results" },
      n = { "<cmd>UltestNearest<cr>", "Run nearest" },
      N = { "<cmd>UltestStopNearest<cr>", "Stop nearest" },
      o = { "<cmd>UltestOutput<cr>", "Show output" },
      S = { "<cmd>UltestSummary<cr>", "Summary win" },
    },
  }

  wk.register(mappings, opts)
end

return M
