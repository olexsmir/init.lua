Config = {}

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

local grp = vim.api.nvim_create_augroup("olexsmir", { clear = true })

---@param ev vim.api.keyset.events|vim.api.keyset.events
---@param opts vim.api.keyset.create_autocmd
Config.aucmd = function(ev, opts)
  vim.api.nvim_create_autocmd(ev, vim.tbl_extend("force", { group = grp }, opts))
end

---@param ev vim.api.keyset.events|vim.api.keyset.events
---@param pattern string|string[]|nil
---@param callback fun()|fun(event)
Config.aucmd2 = function(ev, pattern, callback)
  Config.aucmd(ev, { pattern = pattern, callback = callback })
end

Config.later = vim.schedule
Config.packchange = function(pname, kinds, callback)
  if type(kinds) == "string" then kinds = { kinds } end
  Config.aucmd2("PackChanged", "*", function(ev)
    if not (ev.data.spec.name and vim.tbl_contains(kinds, ev.data.kind)) then return end
    if not ev.data.active then vim.cmd.packadd(pname) end
    callback()
  end)
end
