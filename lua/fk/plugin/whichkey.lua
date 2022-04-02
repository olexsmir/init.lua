local wk = require "which-key"

wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
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
  key_labels = { ["<space>"] = "SPC", ["<cr>"] = "RET", ["<tab>"] = "TAB" },
  icons = { breadcrumb = "»", separator = "➜", group = "+" },
  window = {
    border = "none",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 4,
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
  c = { "<cmd>bdelete!<cr>", "Close buffer" },
  h = { "<cmd>nohlsearch<cr>", "No search hl" },
  n = { "<cmd>e! /tmp/note.md<cr>", "Open note" },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    g = { "<cmd>Telescope git_status<cr>", "Git status" },
    r = { "<cmd>Telescope oldfiles<cr>", "Find oldfile" },
    t = { "<cmd>Telescope live_grep<cr>", "Live grep" },
  },
  l = {
    name = "Lsp",
    a = { "<cmd>Telescope lsp_code_actions<cr>", "Code actions" },
    q = { "<cmd>TroubleToggle<cr>", "Diagnostics menu" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Lsp info" },
    R = { "<cmd>LspRestart<cr>", "Restart lsp server" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens action" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
  },
  t = {
    name = "Tabs",
    l = { "<cmd>tabnext<cr>", "Next tab" },
    h = { "<cmd>tabprev<cr>", "Prev tab" },
    N = { "<cmd>tabnew<cr>", "New tab" },
  },
  g = {
    name = "Git",
    g = { "<cmd>Neogit<cr>", "Neogit" },
    s = { "<cmd>lua require[[gitsigns]].stage_hunk()<cr>", "Stage hunk" },
    r = { "<cmd>lua require[[gitsigns]].reset_hunk()<cr>", "Reset hunk" },
    p = { "<cmd>lua require[[gitsigns]].preview_hunk()<cr>", "Preview hunk" },
    b = { "<cmd>lua require[[gitsigns]].blame_line {}<cr>", "Blame line" },
    R = { "<cmd>lua require[[gitsigns]].reset_buffer()<cr>", "Reset buffer" },
    S = { "<cmd>lua require[[gitsigns]].stage_buffer()<cr>", "Stage buffer" },
  },
}

wk.register(mappings, opts)
