---@return vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
  },
  settings = {
    Lua = {
      format = { enable = false },
      completion = { callSnippet = "Replace" },
      telemetry = { enable = false },
      runtime = { version = "LuaJIT" },
      hint = {
        enable = true,
        arrayIndex = "Disable",
        await = true,
        paramName = "Disable",
        paramType = false,
        semicolon = "Disable",
        setType = true,
      },
    },
  },
}
