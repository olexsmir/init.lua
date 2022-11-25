require("gitsigns").setup {
  max_file_length = 1000,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = "eol",
    delay = 300,
  },
  on_attach = function(bufnr)
    local g = package.loaded.gitsigns
    local map = function(from, to)
      vim.keymap.set("n", from, to, {
        buffer = bufnr,
        noremap = true,
        silent = true,
      })
    end

    map("]g", g.next_hunk)
    map("[g", g.prev_hunk)
    map("<leader>gs", g.stage_hunk)
    map("<leader>gu", g.undo_stage_hunk)
    map("<leader>gr", g.reset_hunk)
    map("<leader>gp", g.preview_hunk)
    map("<leader>gb", function()
      g.blame_line { full = true }
    end)
    map("<leader>gd", g.diffthis)
  end,
}
