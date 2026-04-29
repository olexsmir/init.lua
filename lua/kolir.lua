local function hl(g, o) vim.api.nvim_set_hl(0, g, o) end
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x",
    math.min(255, math.max(0, r)),
    math.min(255, math.max(0, g)),
    math.min(255, math.max(0, b)))
end

local function rgb_to_hsl(r, g, b)
  r, g, b = r / 255, g / 255, b / 255
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local l = (max + min) / 2
  if max == min then return 0, 0, l end

  local d = max - min
  local s = l > 0.5 and d / (2 - max - min) or d / (max + min)
  local h
  if max == r then
    h = (g - b) / d + (g < b and 6 or 0)
  elseif max == g then
    h = (b - r) / d + 2
  else
    h = (r - g) / d + 4
  end
  return h / 6, s, l
end

local function hsl_to_rgb(h, s, l)
  if s == 0 then
    local v = math.floor(l * 255)
    return v, v, v
  end

  local function f(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1 / 6 then return p + (q - p) * 6 * t end
    if t < 1 / 2 then return q end
    if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
    return p
  end

  local q = l < 0.5 and l * (1 + s) or l + s - l * s
  local p = 2 * l - q
  return math.floor(f(p, q, h + 1 / 3) * 255), math.floor(f(p, q, h) * 255), math.floor(f(p, q, h - 1 / 3) * 255)
end

local function adjust_hsl(hex, dh, ds, dl)
  local h, s, l = rgb_to_hsl(hex_to_rgb(hex))
  return rgb_to_hex(hsl_to_rgb((h + (dh or 0)) % 1, math.min(1, math.max(0, s + (ds or 0))),
    math.min(1, math.max(0, l + (dl or 0)))))
end

-- Blend two colors in RGB space (semantic -> background-safe)
local function mix(hex_a, hex_b, t)
  local ar, ag, ab = hex_to_rgb(hex_a)
  local br, bg, bb = hex_to_rgb(hex_b)
  return rgb_to_hex(math.floor(ar + (br - ar) * t), math.floor(ag + (bg - ag) * t), math.floor(ab + (bb - ab) * t))
end

return function(theme)
  local is_dark = vim.o.background == "dark"

  -- Background shading
  theme.bg_alt = adjust_hsl(theme.bg, 0, 0, is_dark and 0.070 or -0.070)
  theme.bg_dim = adjust_hsl(theme.bg, 0, 0, is_dark and -0.024 or 0.024)
  theme.fg_dim = mix(theme.fg, theme.bg, is_dark and 0.45 or 0.35)

  -- Semantic surfaces, Accent colors are *pulled toward background*, not crushed in lightness
  theme.highlight_bg = mix(theme.primary, theme.bg, is_dark and 0.58 or 0.68)
  theme.positive_bg = mix(theme.secondary, theme.bg, is_dark and 0.75 or 0.80)
  theme.negative_bg = mix(theme.muted, theme.bg, is_dark and 0.75 or 0.80)

  -- Diagnostics
  theme.error = theme.marker
  theme.warning = theme.marker
  theme.information = theme.muted
  theme.hint = theme.muted

  theme.black = mix(theme.bg, "#000000", is_dark and 0.20 or 0.35)
  theme.fg_gutter = mix(mix(theme.fg, theme.primary, 0.30), theme.bg, is_dark and 0.60 or 0.45)
  theme.nontext = mix(theme.fg, theme.bg, is_dark and 0.74 or 0.58)

  -- Terminal colors
  vim.g.terminal_color_0 = theme.black
  vim.g.terminal_color_1 = theme.marker
  vim.g.terminal_color_2 = theme.secondary
  vim.g.terminal_color_3 = adjust_hsl(theme.secondary, 0.10, 0, 0)
  vim.g.terminal_color_4 = theme.primary
  vim.g.terminal_color_5 = adjust_hsl(theme.primary, 0.15, 0, 0)
  vim.g.terminal_color_6 = adjust_hsl(theme.secondary, -0.10, 0, 0)
  vim.g.terminal_color_7 = theme.fg
  vim.g.terminal_color_15 = adjust_hsl(theme.fg, 0, 0, is_dark and 0.15 or -0.15)

  -- highlights
  hl("Normal", { fg = theme.fg, bg = theme.bg })
  hl("NormalFloat", { fg = theme.fg, bg = theme.bg_dim })
  hl("FloatBorder", { bg = theme.bg_dim, fg = theme.primary })
  hl("EndOfBuffer", { fg = theme.bg })
  hl("Cursor", { bg = theme.bg, fg = theme.fg })
  hl("CursorLine", { bg = theme.bg_alt })
  hl("CursorLineNr", { bold = true, fg = theme.marker })
  hl("SignColumn", { bg = theme.bg, fg = theme.fg_dim })
  hl("LineNr", { fg = theme.fg_gutter })
  hl("FloatTitle", { bg = theme.bg_dim, fg = theme.primary, bold = true })
  hl("Title", { fg = theme.primary, bold = true })

  hl("ErrorMsg", { fg = theme.error })
  hl("WarningMsg", { fg = theme.warning })
  hl("ModeMsg", { bold = true, fg = theme.fg })
  hl("MoreMsg", { fg = theme.fg })
  hl("Question", { fg = theme.fg })

  hl("Pmenu", { bg = theme.bg_dim, fg = theme.fg })
  hl("PmenuSel", { bg = theme.bg_alt, fg = theme.fg })
  hl("PmenuSbar", { bg = theme.bg_alt })
  hl("PmenuThumb", { bg = theme.fg_dim })
  hl("WildMenu", { bg = theme.bg_alt, fg = theme.fg })
  hl("WinSeparator", { bold = true, fg = theme.black })
  hl("VertSplit", { fg = theme.black })
  hl("Search", { bg = theme.highlight_bg, fg = theme.fg })
  hl("IncSearch", { bg = theme.marker, fg = theme.bg })
  hl("Visual", { bg = theme.negative_bg })

  hl("MatchParen", { bold = true, fg = theme.marker })
  hl("Directory", { fg = theme.primary })
  hl("NonText", { fg = theme.nontext })
  hl("SpecialKey", { link = "NonText" })
  hl("StatusLine", { bg = theme.bg_dim, fg = theme.fg })
  hl("StatusLineNC", { bg = theme.bg_dim, fg = theme.fg_dim })
  hl("TabLine", { bg = theme.bg_dim, fg = theme.fg_dim })
  hl("TabLineFill", { bg = theme.bg_dim, fg = theme.fg })
  hl("TabLineSel", { bg = theme.primary, fg = theme.bg })

  hl("Comment", { fg = theme.marker, italic = true })
  hl("SpecialComment", { fg = theme.marker, bold = true })
  hl("Debug", { fg = theme.muted })
  hl("Exception", { fg = theme.muted })
  hl("Label", { fg = theme.muted })
  hl("Repeat", { fg = theme.muted })
  hl("Todo", { fg = theme.bg, bg = theme.marker, bold = true })

  hl("Keyword", { fg = theme.muted, italic = true })
  hl("Conditional", { fg = theme.muted })
  hl("Statement", { fg = theme.muted })
  hl("Include", { fg = theme.muted })
  hl("PreCondit", { fg = theme.muted })
  hl("PreProc", { fg = theme.muted })
  hl("StorageClass", { fg = theme.muted })
  hl("Operator", { fg = theme.muted })
  hl("Delimiter", { fg = theme.fg_dim })
  hl("SpecialChar", { fg = theme.primary })

  hl("Constant", { fg = theme.secondary })
  hl("String", { fg = theme.secondary })
  hl("Character", { fg = theme.secondary })
  hl("Number", { fg = theme.secondary })
  hl("Boolean", { fg = theme.secondary })
  hl("Float", { fg = theme.secondary })

  hl("Function", { fg = theme.primary })
  hl("Type", { fg = theme.primary })
  hl("Structure", { fg = theme.primary })
  hl("Typedef", { fg = theme.primary })
  hl("Tag", { fg = theme.primary })
  hl("Define", { fg = theme.primary })
  hl("Macro", { fg = theme.primary })

  hl("Identifier", { fg = theme.fg })
  hl("Special", { fg = theme.primary })
  hl("Error", { fg = theme.error })

  hl("QuickFixLine", { bg = theme.bg_alt, bold = true })
  hl("qfFileName", { fg = theme.primary })
  hl("qfLineNr", { fg = theme.fg_gutter })

  hl("DiffAdd", { bg = theme.positive_bg, fg = theme.secondary })
  hl("DiffChange", { bg = theme.highlight_bg, fg = theme.primary })
  hl("DiffDelete", { bg = theme.negative_bg, fg = theme.marker })
  hl("DiffText", { bg = theme.bg_alt, fg = theme.primary, bold = true })
  hl("diffAdded", { fg = theme.secondary })
  hl("diffChanged", { fg = theme.primary })
  hl("diffRemoved", { fg = theme.marker })

  hl("DiagnosticSignError", { fg = theme.error })
  hl("DiagnosticSignWarn", { fg = theme.warning })
  hl("DiagnosticSignInfo", { fg = theme.information })
  hl("DiagnosticSignHint", { fg = theme.hint })

  -- treesitter
  hl("@field", { link = "Type" })
  hl("@property", { link = "Type" })
  hl("@keyword.return", { fg = theme.muted, italic = true })

  hl("@punctuation.delimiter", { fg = theme.fg_dim })
  hl("@punctuation.bracket", { fg = theme.fg_dim })
  hl("@punctuation.special", { fg = theme.fg_dim })

  -- plugins
  hl("SnacksPickerDir", { fg = theme.fg_gutter })
  hl("SnacksPickerPathHidden", { fg = theme.fg_gutter })
  hl("SnacksPickerPathIgnored", { fg = theme.fg_gutter })
  -- todo: add mini.nvim groups
end
