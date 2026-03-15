Config.add "folke/snacks.nvim"

local function wrap(mod, fn, opts)
  return function()
    return Snacks[mod][fn](opts or {})
  end
end

Config.map("n", "<leader>d", wrap("picker", "resume"))
Config.map("n", "<leader>f", wrap("picker", "smart"))
Config.map("n", "<leader>b", wrap("picker", "buffers"))
Config.map("n", "<leader>sr", wrap("picker", "recent"))
Config.map("n", "<leader>sg", wrap("picker", "grep", { args = { "-i" } }))
Config.map("n", "<leader>sd", wrap("picker", "diagnostics"))
Config.map("n", "<leader>sh", wrap("picker", "help"))
Config.map("n", "z=", wrap("picker", "spelling"))

require("snacks").setup {
  image = {
    enabled = true,
    doc = { inline = false },
  },
  words = {
    enabled = true,
    debounce = 100,
  },
  picker = {
    enabled = true,
    main = { current = true },
    layout = {
      preset = "ivy",
      layout = { height = 25 },
    },
    win = {
      input = {
        keys = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
          ["<C-k>"] = { "" },
          ["<C-j>"] = { "" },
        },
      },
    },
    sources = {
      select = { layout = { preset = "ivy" } },
      spelling = { layout = { preset = "ivy" } },
      smart = { multi = { "buffers", "files" } },
    },
  },
}
