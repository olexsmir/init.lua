vim.loader.enable()

Config = {}
Config.map = function(mode, from, to, buffer)
  vim.keymap.set(mode, from, to, {
    noremap = true,
    silent = true,
    buffer = buffer or false,
  })
end

Config.add = function(opts)
  if type(opts) == "string" then
    vim.pack.add { "https://github.com/" .. opts }
  elseif type(opts) == "table" and opts.src then
    vim.pack.add {
      vim.tbl_extend("force", opts, { src = "https://github.com/" .. opts.src }),
    }
  end
end

local grp = vim.api.nvim_create_augroup("olexsmir", { clear = true })
Config.audocmd = function(ev, opts)
  vim.api.nvim_create_autocmd(ev, vim.tbl_extend("force", { group = grp }, opts))
end

Config.aucmd = function(ev, pattern, callback)
  Config.audocmd(ev, { pattern = pattern, callback = callback })
end

Config.later = vim.schedule
Config.onpack = function(pname, kinds, callback)
  if type(kinds) == "string" then kinds = { kinds } end
  Config.aucmd("PackChanged", "*", function(ev)
    if not (ev.data.spec.name and vim.tbl_contains(kinds, ev.data.kind)) then return end
    if not ev.data.active then vim.cmd.packadd(pname) end
    callback()
  end)
end
