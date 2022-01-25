local M = {}

function M.setup()
  vim.g["conjure#mapping#doc_word"] = "K"
  vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  vim.g["conjure#log#botright"] = true
  vim.g["conjure#extract#tree_sitter#enabled"] = true
  vim.g["conjure#eval#result_register"] = "*"
  vim.g["g:conjure#log#jump_to_latest#cursor_scroll_position"] = "bottom"
end


return M
