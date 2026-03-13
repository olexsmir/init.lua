Config = {}

-- TODO: alternative syntax: map("key", ":something") = map("n", "key", "something")
---@param mode string|table
---@param from string
---@param to string|function
---@param buffer? integer|boolean
Config.map = function(mode, from, to, buffer)
  vim.keymap.set(mode, from, to, {
    noremap = true,
    silent = true,
    buffer = buffer or false,
  })
end

-- TODO:
-- 1. set custom group for each augroup
-- 2. syntax like: aucmd("PackChanged", "*", function() end) sets pattern and callback
Config.aucmd = vim.api.nvim_create_autocmd

Config.packchange = function(pname, kinds, callback)
  Config.aucmd("PackChanged", {
    pattern = "*",
    callback = function(ev)
      if not (ev.data.spec.name and vim.tbl_contains(kinds, ev.data.kind)) then return end
      if not ev.data.active then vim.cmd.packadd(pname) end
      callback()
    end,
  })
end
