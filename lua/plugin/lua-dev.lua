local M = {}

function M.setup()
  require("lua-dev").setup {
    library = {
      vimruntime = true,
      types = true,
      plugins = true,
    },
    runtime_path = false,
  }
end

return M
