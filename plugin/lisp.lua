Config.later(function()
  Config.add "gpanders/nvim-parinfer"
  Config.add "Olical/conjure"
end)

vim.g["conjure#filetypes"] = { "clojure", "fennel", "lisp", "janet", "scheme", "sql" }
vim.g["conjure#log#hud#passive_close_delay"] = 2000
vim.g["conjure#highlight#enabled"] = true
vim.g["conjure#highlight#timeout"] = 100

vim.g["conjure#mapping#enable_defaults"] = false
vim.g["conjure#mapping#prefix"] = "<leader>j"
vim.g["conjure#mapping#doc_word"] = { "K" }
vim.g["conjure#mapping#log_vsplit"] = "l"
vim.g["conjure#mapping#log_reset_soft"] = "R"
vim.g["conjure#mapping#eval_current_form"] = "e"
vim.g["conjure#mapping#eval_visual"] = "e"
vim.g["conjure#mapping#eval_root_form"] = "r"
vim.g["conjure#mapping#eval_word"] = "w"
vim.g["conjure#mapping#eval_buf"] = "b"

vim.g["conjure#client#clojure#nrepl#mapping#interrupt"] = "Ei"
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = false
