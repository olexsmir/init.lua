-- TODO: oil -> mini.files ??
-- TODO: go though my options.lua
-- TODO: i might need to delete some lsp servers
-- TODO: ftplugins/
-- TODO: remove json and yaml servers ????
-- TODO: redo some of my scripts
-- TODO: reorganize my plugin/
-- TODO: optimize of start up time (some things should be loaded with vim.schedule)

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

---@param ev vim.api.keyset.events|vim.api.keyset.events
---@param opts vim.api.keyset.create_autocmd
Config.aucmd = function(ev, opts)
  opts = vim.tbl_deep_extend("force", opts, {
    group = vim.api.nvim_create_augroup("olexsmir", {}),
  })
  vim.api.nvim_create_autocmd(ev, opts)
end

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
