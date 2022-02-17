local M = {}

local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
  local opts = {
    cursor = 5,
    width = 50,
    shortcut = sc,
    position = "center",
    hl_shortcut = "Keyword",
    align_shortcut = "right",
  }
  if keybind then
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "normal", false)
  end

  return {
    val = txt,
    opts = opts,
    type = "button",
    on_press = on_press,
  }
end

function M.setup()
  local alpha = require "alpha"

  local section = {
    header = {
      type = "text",
      opts = { position = "center", hl = "String" },
      val = {
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⡀⡢⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢮⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠀⡠⡂⣊⠢⡑⡐⠄⠀⠀⠀⠀⠀⠀⢀⢔⡕⣕⢗⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠢⠨⢢⠢⡃⡪⡐⡑⢄⠀⠀⠀⠀⢰⢱⡣⣫⢪⢮⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⡑⠅⢅⠣⡊⡢⡊⢌⠢⡂⡀⠀⠀⢐⢧⢳⢕⢧⢳⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠪⡨⠢⠡⡑⠰⡘⡌⡪⡂⡆⠄⠀⢐⡕⣗⢕⡗⡵⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠕⢌⠪⡨⢌⠀⠘⡰⡑⡌⡪⡊⣂⠀⡯⣪⡳⣹⡪⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠕⡅⠕⢌⠢⠀⠀⠀⢕⢅⢇⢕⢒⢬⢺⢕⢽⢜⢮⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⢕⢘⠜⢌⠪⠀⠀⠀⠀⠪⡢⡣⡣⡣⡳⣹⢕⢯⡳⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⢕⢅⢣⢑⠕⠀⠀⠀⠀⠀⠘⢜⢌⢎⢞⢎⢯⡳⡝⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⢕⢌⠆⠁⠀⠀⠀⠀⠀⠀⠀⠈⢎⢎⣗⢽⠑⠉⠀⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⠓⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀neovim⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      },
    },
    buttons = {
      type = "group",
      val = {
        button("f", "  search files", "<cmd>Telescope find_files<cr>"),
        button("p", "ﰍ  search project", "<cmd>Telescope projects<cr>"),
        button("e", "  open file explorer", "<cmd>NvimTree<cr>"),
        button("n", "  new file", "<cmd>ene <cr>"),
      },
    },
  }

  local opts = {
    layout = {
      { type = "padding", val = 2 },
      section.header,
      { type = "padding", val = 2 },
      section.buttons,
    },
    opts = { margin = 5 },
  }

  alpha.setup(opts)
end

return M
