local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua" },
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    -- autotag = { enable = true },
    -- context_commentstring = { enable = true },
    -- rainbow = {
    -- enable = false,
    -- extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    -- max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    -- },
  }
end

return M
