require("gitsigns").setup {
  max_file_length = 1000,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = "eol",
    delay = 300,
  },
}
