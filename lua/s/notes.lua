---@module 'blink.cmp'
---@class blink.cmp.Source
local source = {}

function source.new(_)
  return setmetatable({}, { __index = source })
end

function source:enabled()
  return (vim.api.nvim_get_current_line():match "^tags" ~= nil)
    and vim.bo.filetype == "markdown"
end

function source:get_trigger_characters()
  return { " " }
end

local function collect_segments()
  local seen = {}
  local segments = {}

  vim
    .iter(vim.fn.getline(1, "$"))
    :filter(function(l)
      return l:match "^tags"
    end)
    :map(function(s)
      return vim.split(s, "%s+")
    end)
    :flatten()
    :filter(function(s)
      return s:match ":"
    end)
    :each(function(tag)
      for _, part in ipairs(vim.split(tag, ":")) do
        if part ~= "" and part ~= "tags" and not seen[part] then
          seen[part] = true
          table.insert(segments, part)
        end
      end
    end)

  table.sort(segments)
  return segments
end

local function make_item(s, ctx, segment_start)
  return {
    label = s,
    textEdit = {
      newText = s,
      range = {
        start = { line = ctx.cursor[1] - 1, character = segment_start },
        ["end"] = { line = ctx.cursor[1] - 1, character = ctx.cursor[2] },
      },
    },
  }
end

function source:get_completions(ctx, callback)
  local before_cursor = ctx.line:sub(1, ctx.cursor[2])
  local segment_start = before_cursor:find "%S+$" - 1 or ctx.cursor[2]
  callback {
    is_incomplete_forward = false,
    is_incomplete_backward = false,
    items = vim
      .iter(collect_segments())
      :map(function(s)
        return make_item(s, ctx, segment_start)
      end)
      :totable(),
  }
  return function() end
end

return source
