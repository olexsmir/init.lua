return {
  {
    "eraserhd/parinfer-rust",
    ft = { "clojure", "fennel", "scheme", "lisp" },
    build = "cargo build --release",
  },
  {
    "Olical/conjure",
    ft = { "lua", "clojure", "fennel", "scheme", "lisp" },
    branch = "develop",
    dependencies = { "PaterJason/cmp-conjure" },
    init = function()
      vim.g["conjure#mapping#doc_word"] = false
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
      vim.g["conjure#extract#tree_sitter#enabled"] = true
    end,
    config = function()
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
  },
}
