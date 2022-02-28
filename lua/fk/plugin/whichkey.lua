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
  n = { "<cmd>e! /tmp/note.md<cr>", "Note" },
  s = {
    name = "Search",
    t = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    r = { "<cmd>Telescope oldfiles<cr>", "Find oldfile" },
    b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    s = { "<cmd>Telescope spell_suggest<cr>", "Spell suggest" },
    k = { "<cmd>Telescope keymaps<cr>", "Find keymap" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>Telescope lsp_code_actions<cr>", "Code actions" },
    d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    R = { "<cmd>LspRestart<cr>", "Restart server" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
  },
  t = {
    name = "Tests",
    t = { "<cmd>Ultest<cr>", "Run all" },
    s = { "<cmd>UltestStop<cr>", "Stop all" },
    c = { "<cmd>UltestClear<cr>", "Clean results" },
    n = { "<cmd>UltestNearest<cr>", "Run nearest" },
    N = { "<cmd>UltestStopNearest<cr>", "Stop nearest" },
    o = { "<cmd>UltestOutput<cr>", "Show output" },
    S = { "<cmd>UltestSummary<cr>", "Summary win" },
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
    name = "Packer",
    s = { "<cmd>PackerSync<cr>", "Sync" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    C = { "<cmd>PackerClean<cr>", "Clean" },
  },
}

wk.register(mappings, opts)
