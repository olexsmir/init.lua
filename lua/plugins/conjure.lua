local lisp_ft = { "clojure", "fennel", "scheme", "lisp" }
local ft = vim.tbl_deep_extend("keep", { "lua" }, lisp_ft)
return {
  { "eraserhd/parinfer-rust", ft = lisp_ft, build = "cargo build --release" },
  {
    "Olical/conjure",
    ft = ft,
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
