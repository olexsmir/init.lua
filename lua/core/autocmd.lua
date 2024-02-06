local aucmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("olexsmir_" .. name, { clear = true })
end

aucmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

aucmd("VimResized", {
  group = augroup "resize_splits",
  callback = function()
    vim.cmd "tabdo wincmd ="
    vim.cmd("tabnext " .. vim.fn.tabpagenr())
  end,
})

aucmd("FileType", {
  group = augroup "comments",
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})
