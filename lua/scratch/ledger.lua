local t = require("blink.cmp.types").CompletionItemKind

---@module 'blink.cmp'
---@class blink.cmp.Source
local source = {}

function source.new(_)
  return setmetatable({}, { __index = source })
end

function source:enabled()
  return vim.bo.filetype == "ledger"
end

function source:get_trigger_characters()
  return { ":", "as", "eq", "li", "in", "ex" }
end

function source:get_completions(_, callback)
  local rs = vim
    .system({ "hledger", "accounts", "--flat" }, { text = true })
    :wait()

  ---@type lsp.CompletionItem[]
  local items = rs.code == 0
      and vim
        .iter(vim.split(rs.stdout, "\n"))
        :map(function(acc)
          return {
            label = acc,
            kind = t.Property,
            insertTextFormat = vim.lsp.protocol.InsertTextFormat.PlainText,
          }
        end)
        :totable()
    or {}

  callback {
    items = items,
    is_incomplete_backward = false,
    is_incomplete_forward = false,
  }

  return function() end
end

return source
