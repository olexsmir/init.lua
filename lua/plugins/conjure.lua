local ft = { "clojure", "fennel", "scheme", "lisp" }
return {
  "Olical/conjure",
  ft = ft,
  branch = "develop",
  dependencies = {
    "PaterJason/cmp-conjure",
    { "eraserhd/parinfer-rust", build = "cargo build --release" },
  },
  init = function()
    vim.g["conjure#mapping#doc_word"] = false
    vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
  end,
  config = function()
    require("conjure.main").main()
    require("conjure.mapping")["on-filetype"]()
    require("cmp").setup.filetype(ft, {
      sources = { { name = "conjure", max_item_count = 4 } },
    })
  end,
}
