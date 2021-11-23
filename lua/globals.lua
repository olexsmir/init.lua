function _G.term_cmd(cmd)
  require("toggleterm.terminal").Terminal:new({ cmd = cmd, hidden = true }):toggle()
end
