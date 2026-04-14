local langs = {
  c = "C",
  gleam = "Gleam",
  go = "Go",
  hare = "Hare",
  javascript = "JavaScript",
  ledger = "Hledger",
  lua = "Lua",
  ocaml = "OCaml",
  odin = "Odin",
  typescript = "TypeScript",
  zig = "Zig",
}

return function(pattern, _, _)
  local ft = langs[vim.bo.filetype]
  if not ft then return vim.NIL end

  local tags = vim.fn.taglist(pattern)
  if not tags then return vim.NIL end

  return vim.iter(tags)
      :filter(function(t) return t.language == ft end)
      :totable()
end
